Map<String, dynamic> modelo = {
  "message": "Fluxos de trabalho encontrados com sucesso.",
  "data": {
    "workflow": [
      {
        "id": 1,
        "companyId": 1,
        "companyName": "CHIPTRONIC TECNOLOGIA AUTOMOTIVA",
        "companyLegalName": "CHIPTRONIC ELETRONICA DO BRASIL LTDA",
        "parentCompanyId": null,
        "parentCompanyName": null,
        "parentCompanyLegalName": null,
        "name": "Instalação",
        "description": "Rastreador + ConnectBus",
        "timestamp": "2025-08-26T17:50:00.000Z",
        "step": [
          {
            "workflowStepId": 1,
            "workflowStepName": "Preparação",
            "workflowStepOrdination": 1,
            "workflowStepStartTimeStamp": "2025-08-26T17:50:00.000Z",
            "workflowStepEndTimeStamp": "2025-08-26T17:50:00.000Z",
            "action": [
              {
                "workflowStepActionId": 9,
                "workflowStepActionName": "Verificar equipamentos",
                "workflowStepActionType": "CHECKLIST",
                "workflowStepActionRequired": 0,
                "workflowStepActionOrdination": 1,
                "workflowStepActionConfiguration": {
                  "help": "",
                  "items": [
                    {"id": 1, "label": "Item 1"},
                  ],
                  "dependency": [],
                  "allowComment": 0,
                  "maximumPicture": 0,
                  "minimumPicture": 0,
                },
              },
              {
                "workflowStepActionId": 10,
                "workflowStepActionName": "Número de série do rastreador",
                "workflowStepActionType": "INPUT_NUMBER",
                "workflowStepActionRequired": 0,
                "workflowStepActionOrdination": 2,
                "workflowStepActionConfiguration": {
                  "help": "Digite o número visível na etiqueta",
                  "items": [],
                  "dependency": [1],
                  "allowComment": 0,
                  "maximumPicture": 2,
                  "minimumPicture": 1,
                },
              },
            ],
          },
          {
            "workflowStepId": 2,
            "workflowStepName": "Configuração",
            "workflowStepOrdination": 2,
            "workflowStepStartTimeStamp": "2025-08-26T17:50:00.000Z",
            "workflowStepEndTimeStamp": "2025-08-26T17:50:00.000Z",
            "action": [
              {
                "workflowStepActionId": 10,
                "workflowStepActionName": "Número de série do Connectbus",
                "workflowStepActionType": "INPUT_NUMBER",
                "workflowStepActionRequired": 0,
                "workflowStepActionOrdination": 2,
                "workflowStepActionConfiguration": {
                  "help": "Digite o número visível na etiqueta",
                  "items": [],
                  "values": {"comments": "", "boolean": 1, "pictures": [
                       
                    ]
                  },
                  "dependency": [1],
                  "allowComment": 0,
                  " ": 2,
                  "minimumPicture": 1,
                },
              },
            ],
          },
          {
            "workflowStepId": 3,
            "workflowStepName": "Instalação connect bus",
            "workflowStepOrdination": 2,
            "workflowStepStartTimeStamp": "2025-08-26T17:50:00.000Z",
            "workflowStepEndTimeStamp": "",
            "action": [
              {
                "workflowStepActionId": 10,
                "workflowStepActionName": "Número de série do Connectbus",
                "workflowStepActionType": "INPUT_NUMBER",
                "workflowStepActionRequired": 0,
                "workflowStepActionOrdination": 2,
                "workflowStepActionConfiguration": {
                  "help": "Digite o número visível na etiqueta",
                  "items": [],
                  "values": {"comments": "", "boolean": 1, "pictures": [
                       
                    ]
                  },
                  "dependency": [1],
                  "allowComment": 0,
                  " ": 2,
                  "minimumPicture": 1,
                },
              },
            ],
          },
          {
            "workflowStepId": 4,
            "workflowStepName": "Configuração do dispositivo",
            "workflowStepOrdination": 2,
            "workflowStepStartTimeStamp": "2025-08-26T17:50:00.000Z",
            "workflowStepEndTimeStamp": "",
            "action": [
              {
                "workflowStepActionId": 10,
                "workflowStepActionName": "Número de série do Connectbus",
                "workflowStepActionType": "INPUT_NUMBER",
                "workflowStepActionRequired": 0,
                "workflowStepActionOrdination": 2,
                "workflowStepActionConfiguration": {
                  "help": "Digite o número visível na etiqueta",
                  "items": [],
                  "values": {"comments": "", "boolean": 1, "pictures": [
                       
                    ]
                  },
                  "dependency": [1],
                  "allowComment": 0,
                  " ": 2,
                  "minimumPicture": 1,
                },
              },
            ],
          },
          {
            "workflowStepId": 5,
            "workflowStepName": "Finalização",
            "workflowStepOrdination": 2,
            "workflowStepStartTimeStamp": "2025-08-26T17:50:00.000Z",
            "workflowStepEndTimeStamp": "",
            "action": [
              {
                "workflowStepActionId": 10,
                "workflowStepActionName": "Número de série do Connectbus",
                "workflowStepActionType": "INPUT_NUMBER",
                "workflowStepActionRequired": 0,
                "workflowStepActionOrdination": 2,
                "workflowStepActionConfiguration": {
                  "help": "Digite o número visível na etiqueta",
                  "items": [],
                  "values": {"comments": "", "boolean": 1, "pictures": [
                       
                    ]
                  },
                  "dependency": [1],
                  "allowComment": 0,
                  " ": 2,
                  "minimumPicture": 1,
                },
              },
            ],
          },
        ],
      },
    ],
  },
};

Map<String, dynamic> arrayOS = {
  "serviceOrder": [
    {
      "id": 1,
      "companyId": 1,
      "companyName": "Empresa 1",
      "companyLegalName": "Empresa 1",
      "recipientCompanyId": 1,
      "recipientCompanyName": "Empresa 2",
      "recipientCompanyLegalName": "Empresa 2",
      "orderNumber": "2025-00001",
      "workflowId": 1,
      "workflowName": "Instalação",
      "workflowDescription": "Rastreador + ConnectBus",
      "serviceOrderStatusId": 1,
      "serviceOrderStatusDescription": "Agendado",
      "startTimestamp": "2025-08-27T21:58:55.000Z",
      "endTimestamp": null,
      "vehicleId": 2,
      "vehicleExternalId": null,
      "vehicleLicensePlate": "PKC6564",
      "employeeId": 1,
      "employeeFullName": "Joao da Silva",
      "deadline": 1,
      "deadlineTimestamp": "2025-08-27T21:58:55.000Z",
      "attempt": 5,
      "latitude": "-23.206318",
      "longitude": "-49.376382",
      "additionalInformation": "teste realizado 2",
      "serviceOrderCancellationId": null,
      "serviceOrderCancellationDescription": null,
      "comment": null,
      "digitalSignatureURL": null,
      "timestamp": "2025-08-27T20:58:55.000Z",
    },
    {
      "id": 2,
      "companyId": 1,
      "companyName": "Empresa 2",
      "companyLegalName": "Empresa 2",
      "recipientCompanyId": 1,
      "recipientCompanyName": "Empresa 3",
      "recipientCompanyLegalName": "Empresa 3",
      "orderNumber": "2025-00001",
      "workflowId": 1,
      "workflowName": "Instalação",
      "workflowDescription": "Rastreador + ConnectBus",
      "serviceOrderStatusId": 1,
      "serviceOrderStatusDescription": "Agendado",
      "startTimestamp": "2025-08-27T21:58:55.000Z",
      "endTimestamp": null,
      "vehicleId": 2,
      "vehicleExternalId": null,
      "vehicleLicensePlate": "PKC6564",
      "employeeId": 1,
      "employeeFullName": "Jose da Silva",
      "deadline": 1,
      "deadlineTimestamp": "2025-08-27T21:58:55.000Z",
      "attempt": 5,
      "latitude": "-23.206318",
      "longitude": "-49.376382",
      "additionalInformation": "teste realizado 2",
      "serviceOrderCancellationId": null,
      "serviceOrderCancellationDescription": null,
      "comment": null,
      "digitalSignatureURL": null,
      "timestamp": "2025-08-27T20:58:55.000Z",
    },
  ],
};
Map<String, dynamic> usuarioMock = {
  "usuario": {
    "id": 1,
    "nome": "Leticia Damasceno",
    "cpf": "123.456.789-00",
    "telefone": "111111111",
    "endereco": "Endereco usuario",
  },
};
