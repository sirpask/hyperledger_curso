/*
Business Blockchain Training & Consulting SpA. All Rights Reserved.
www.blockchainempresarial.com
email: ricardo@blockchainempresarial.com
*/

package main

import (
	"encoding/json"
	"fmt"

	"github.com/hyperledger/fabric-contract-api-go/contractapi"
)

// SmartContract provides functions for control the food (definimos una estructura ya predefinida)
type SmartContract struct {
	contractapi.Contract
}

//Food describes basic details of what makes up a food (en la block chain guardaremos el tipo granjero y variedad de cultivo)
type Food struct {
	Farmer  string `json:"farmer"`
	Variety string `json:"variety"`
}

//para crear una funcion que guarde en la blockchain es crear esa funcion s *Smartcontract es parte de la funcion y luego su novmbre Set (nombre ctx del tipo contractapi.transaction context, y luego añadimos las propiedades de los datos que se van a añadir a la blockchain)
func (s *SmartContract) Set(ctx contractapi.TransactionContextInterface, foodId string, farmer string, variety string) error {

	//Validaciones de sintaxis

	//validaciones de negocio (estructura de go, esta estructura de binario hay que pasarla a json, y se guarde como conjunto de bytes, se hace con marshal)
	/*
		Podriamos preguntar si la transaccion existe, para eso:

		food, err := s.Query(ctx, foodId)
		if food != nil {
			fmt.Printfl("foodId already exist error: %s", err.Error())
			return err
		}

	*/

	food := Food{
		Farmer:  farmer,
		Variety: variety,
	}

	//se transforma en bytes para pasarlos a la blockchain o a json
	foodAsBytes, err := json.Marshal(food)
	if err != nil {
		fmt.Printf("Marshal error: %s", err.Error())
		return err
	}

	//getstub.putstate para permitir guardar en el leger (libro distribuido) como tal necesita un id y un valor) Putstate estampa de tiempo es el historial de tu activo,
	//la estapa del tiempo es algo muy elemntal hace que guarde un estado en el libro distribuido, esta en cualquier blockchain
	// Esta funcion sirve tanto para guardar como para actualizar
	return ctx.GetStub().PutState(foodId, foodAsBytes)
}

//consultar en el ledger una transaccion. *Food hace referencia a la estructura , consultaremos el estado de una transaccion

func (s *SmartContract) Query(ctx contractapi.TransactionContextInterface, foodId string) (*Food, error) {

	foodAsBytes, err := ctx.GetStub().GetState(foodId)

	if err != nil {
		return nil, fmt.Errorf("Failed to read from world state. %s", err.Error())
	}

	if foodAsBytes == nil {
		return nil, fmt.Errorf("%s does not exist", foodId)
	}

	food := new(Food)

	//el unmarsall sirve para transormas de bytes a formato go
	err = json.Unmarshal(foodAsBytes, food)
	if err != nil {
		return nil, fmt.Errorf("Unmarshal error. %s", err.Error())
	}

	return food, nil
}

func main() {

	chaincode, err := contractapi.NewChaincode(new(SmartContract))

	if err != nil {
		fmt.Printf("Error create foodcontrol chaincode: %s", err.Error())
		return
	}
	//levantamos el codigo
	if err := chaincode.Start(); err != nil {
		fmt.Printf("Error starting foodcontrol chaincode: %s", err.Error())
	}
}
