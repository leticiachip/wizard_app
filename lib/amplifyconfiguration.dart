const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "sa-east-1_a6yhg64Ue",
                        "AppClientId": "7mcbdv389vervgs6inrgu8dtfr",
                        "Region": "sa-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "auth.chiptronicsciencetelematic.com.br.auth.sa-east-1.amazoncognito.com",
                            "AppClientId": "7mcbdv389vervgs6inrgu8dtfr",
                            "SignInRedirectURI": "chiptronic0002:app-jornada",
                            "SignOutRedirectURI": "chiptronic0002:app-jornada",
                            "Scopes": [
                                "email",
                                "https://api-driverlog.chiptronicsciencetelematic.com.br/get",
                                "https://api-driverlog.chiptronicsciencetelematic.com.br/post",
                                "openid"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [],
                        "usernameAttributes": [
                            "EMAIL"
                        ],
                        "signupAttributes": [
                            "NAME",
                            "EMAIL",
                            "LOCALE",
                            "PHONE_NUMBER",
                            "ADDRESS"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": [
                                "REQUIRES_LOWERCASE",
                                "REQUIRES_UPPERCASE",
                                "REQUIRES_NUMBERS",
                                "REQUIRES_SYMBOLS"
                            ]
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                }
            }
        }
    }
}''';