const String exerciseResponse = '''
{
    "id": "chatcmpl-9XfkzmXHdGKmPyKyt4qAOXIiPZtfu",
    "object": "chat.completion",
    "created": 1717812365,
    "model": "gpt-3.5-turbo-0125",
    "choices": [
        {
            "index": 0,
            "message": {
                "role": "assistant",
                "content": [
                    {
                        "day": "Lunes",
                        "group": "Pecho y triceps",
                        "exercises": [
                            {
                                "set": "Press de banca con barra",
                                "description": "Acostado en un banco, levanta la barra desde el pecho hasta la extension completa de los brazos.",
                                "series": 3,
                                "reps": 12
                            },
                            {
                                "set": "Fondos en paralelas",
                                "description": "Colocate entre dos barras paralelas, baja el cuerpo flexionando los codos y luego sube.",
                                "series": 3,
                                "reps": 10
                            },
                            {
                                "set": "Extension de triceps con mancuerna",
                                "description": "De pie, levanta una mancuerna hacia arriba extendiendo el brazo completamente.",
                                "series": 3,
                                "reps": 12
                            }
                        ],
                        "cals": "250 cal",
                        "duration": "45 minutos"
                    },
                    {
                        "day": "Martes",
                        "group": "Espalda y biceps",
                        "exercises": [
                            {
                                "set": "Dominadas",
                                "description": "Suspendido de una barra, sube el cuerpo hasta que la barbilla pase la barra.",
                                "series": 3,
                                "reps": 8
                            },
                            {
                                "set": "Remo con barra",
                                "description": "Inclinado, levanta una barra hacia el pecho manteniendo la espalda recta.",
                                "series": 3,
                                "reps": 10
                            },
                            {
                                "set": "Curl de biceps con barra",
                                "description": "De pie, levanta una barra hacia los hombros flexionando los codos.",
                                "series": 3,
                                "reps": 12
                            }
                        ],
                        "cals": "220 cal",
                        "duration": "40 minutos"
                    },
                    {
                        "day": "Miercoles",
                        "group": "Descanso",
                        "exercises": [],
                        "cals": "0 cal",
                        "duration": "0 minutos"
                    },
                    {
                        "day": "Jueves",
                        "group": "Piernas",
                        "exercises": [
                            {
                                "set": "Sentadillas",
                                "description": "De pie, baja el cuerpo flexionando las rodillas y luego vuelve a la posicion inicial.",
                                "series": 4,
                                "reps": 12
                            },
                            {
                                "set": "Prensa de piernas",
                                "description": "Sentado, empuja el peso con las piernas hacia arriba y luego baja controladamente.",
                                "series": 3,
                                "reps": 10
                            },
                            {
                                "set": "Elevacion de talones",
                                "description": "De pie en un escalon, sube los talones hacia arriba y luego baja.",
                                "series": 3,
                                "reps": 15
                            }
                        ],
                        "cals": "280 cal",
                        "duration": "50 minutos"
                    },
                    {
                        "day": "Viernes",
                        "group": "Cardio",
                        "exercises": [
                            {
                                "set": "Carrera continua",
                                "description": "Corre a un ritmo constante durante al menos 30 minutos.",
                                "series": 1,
                                "reps": "30 min"
                            },
                            {
                                "set": "Circuito de alta intensidad",
                                "description": "Realiza una serie de ejercicios de cuerpo completo a alta intensidad durante 20 minutos.",
                                "series": 1,
                                "reps": "20 min"
                            }
                        ],
                        "cals": "350 cal",
                        "duration": "50 minutos"
                    }
                ]
            },
            "logprobs": null,
            "finish_reason": "stop"
        }
    ],
    "usage": {
        "prompt_tokens": 712,
        "completion_tokens": 863,
        "total_tokens": 1575
    },
    "system_fingerprint": null
}
''';

const String dietResponse = '''
  {
  "id": "chatcmpl-9XVgdZkH7PNZxWt0L8NZ3czm0CEMp",
  "object": "chat.completion",
  "created": 1717773655,
  "model": "gpt-3.5-turbo-0125",
  "choices": [
    {
      "index": 0,
      "message": {
        "role": "assistant",
        "content": [
          {
            "day": "Lunes",
            "meals": [
              {
                "meal_time": "Desayuno",
                "name": "Avena con frutas",
                "description": "Avena cocida con trozos de manzana, plátano y fresas",
                "ingredients": [
                  {
                    "name": "avena",
                    "quantity": "1 taza"
                  },
                  {
                    "name": "manzana",
                    "quantity": "1 unidad"
                  },
                  {
                    "name": "plátano",
                    "quantity": "1 unidad"
                  },
                  {
                    "name": "fresas",
                    "quantity": "1/2 taza"
                  }
                ],
                "macros": {
                  "proteins": 5,
                  "calories": 300,
                  "vitamins": [
                    "A",
                    "C"
                  ],
                  "minerals": [
                    "hierro",
                    "calcio"
                  ]
                }
              },
              {
                "meal_time": "Almuerzo",
                "name": "Ensalada de pollo",
                "description": "Ensalada mixta con pechuga de pollo a la plancha",
                "ingredients": [
                  {
                    "name": "pechuga de pollo",
                    "quantity": "100g"
                  },
                  {
                    "name": "lechuga",
                    "quantity": "1 taza"
                  },
                  {
                    "name": "tomate",
                    "quantity": "1 unidad"
                  },
                  {
                    "name": "zanahoria",
                    "quantity": "1 unidad"
                  }
                ],
                "macros": {
                  "proteins": 20,
                  "calories": 250,
                  "vitamins": [
                    "A",
                    "K"
                  ],
                  "minerals": [
                    "potasio",
                    "magnesio"
                  ]
                }
              },
              {
                "meal_time": "Cena",
                "name": "Salmón con espárragos",
                "description": "Filete de salmón al horno con espárragos a la parrilla",
                "ingredients": [
                  {
                    "name": "salmón",
                    "quantity": "150g"
                  },
                  {
                    "name": "espárragos",
                    "quantity": "6 unidades"
                  },
                  {
                    "name": "limón",
                    "quantity": "1/2 unidad"
                  }
                ],
                "macros": {
                  "proteins": 25,
                  "calories": 350,
                  "vitamins": [
                    "D",
                    "B12"
                  ],
                  "minerals": [
                    "hierro",
                    "calcio"
                  ]
                }
              }
            ]
          },
          {
            "day": "Martes",
            "meals": [
              {
                "meal_time": "Desayuno",
                "name": "Yogur con granola",
                "description": "Yogur natural con granola y rodajas de plátano",
                "ingredients": [
                  {
                    "name": "yogur natural",
                    "quantity": "1 envase"
                  },
                  {
                    "name": "granola",
                    "quantity": "1/2 taza"
                  },
                  {
                    "name": "plátano",
                    "quantity": "1 unidad"
                  }
                ],
                "macros": {
                  "proteins": 8,
                  "calories": 200,
                  "vitamins": [
                    "B",
                    "D"
                  ],
                  "minerals": [
                    "calcio",
                    "magnesio"
                  ]
                }
              },
              {
                "meal_time": "Almuerzo",
                "name": "Pechuga de pavo con quinoa",
                "description": "Pechuga de pavo a la plancha con quinoa cocida y mix de verduras al vapor",
                "ingredients": [
                  {
                    "name": "pechuga de pavo",
                    "quantity": "100g"
                  },
                  {
                    "name": "quinoa",
                    "quantity": "1/2 taza"
                  },
                  {
                    "name": "verduras",
                    "quantity": "1 taza"
                  }
                ],
                "macros": {
                  "proteins": 22,
                  "calories": 300,
                  "vitamins": [
                    "B",
                    "E"
                  ],
                  "minerals": [
                    "potasio",
                    "hierro"
                  ]
                }
              },
              {
                "meal_time": "Cena",
                "name": "Revuelto de champiñones",
                "description": "Revuelto de claras de huevo con champiñones y espinacas",
                "ingredients": [
                  {
                    "name": "claras de huevo",
                    "quantity": "4 unidades"
                  },
                  {
                    "name": "champiñones",
                    "quantity": "1/2 taza"
                  },
                  {
                    "name": "espinacas",
                    "quantity": "1 taza"
                  }
                ],
                "macros": {
                  "proteins": 15,
                  "calories": 220,
                  "vitamins": [
                    "A",
                    "K"
                  ],
                  "minerals": [
                    "magnesio",
                    "calcio"
                  ]
                }
              }
            ]
          },
          {
            "day": "Miércoles",
            "meals": [
              {
                "meal_time": "Desayuno",
                "name": "Batido de frutas",
                "description": "Batido de plátano, fresas, avena y leche de almendra",
                "ingredients": [
                  {
                    "name": "plátano",
                    "quantity": "1 unidad"
                  },
                  {
                    "name": "fresas",
                    "quantity": "1/2 taza"
                  },
                  {
                    "name": "avena",
                    "quantity": "2 cucharadas"
                  },
                  {
                    "name": "leche de almendra",
                    "quantity": "1 vaso"
                  }
                ],
                "macros": {
                  "proteins": 7,
                  "calories": 250,
                  "vitamins": [
                    "C",
                    "K"
                  ],
                  "minerals": [
                    "hierro",
                    "potasio"
                  ]
                }
              },
              {
                "meal_time": "Almuerzo",
                "name": "Wrap de pollo",
                "description": "Wrap integral con tiras de pollo a la parrilla, aguacate y mix de vegetales",
                "ingredients": [
                  {
                    "name": "tiras de pollo",
                    "quantity": "100g"
                  },
                  {
                    "name": "wrap integral",
                    "quantity": "1 unidad"
                  },
                  {
                    "name": "aguacate",
                    "quantity": "1/2 unidad"
                  },
                  {
                    "name": "vegetales",
                    "quantity": "1 taza"
                  }
                ],
                "macros": {
                  "proteins": 18,
                  "calories": 320,
                  "vitamins": [
                    "A",
                    "D"
                  ],
                  "minerals": [
                    "magnesio",
                    "calcio"
                  ]
                }
              },
              {
                "meal_time": "Cena",
                "name": "Cazuela de verduras",
                "description": "Cazuela de calabacín, zanahoria, patata y cebolla con caldo de pollo",
                "ingredients": [
                  {
                    "name": "calabacín",
                    "quantity": "1 unidad"
                  },
                  {
                    "name": "zanahoria",
                    "quantity": "1 unidad"
                  },
                  {
                    "name": "patata",
                    "quantity": "1 unidad"
                  },
                  {
                    "name": "cebolla",
                    "quantity": "1/2 unidad"
                  },
                  {
                    "name": "caldo de pollo",
                    "quantity": "1 taza"
                  }
                ],
                "macros": {
                  "proteins": 5,
                  "calories": 230,
                  "vitamins": [
                    "A",
                    "C"
                  ],
                  "minerals": [
                    "potasio",
                    "magnesio"
                  ]
                }
              }
            ]
          },
          {
            "day": "Jueves",
            "meals": [
              {
                "meal_time": "Desayuno",
                "name": "Tostadas de aguacate",
                "description": "Tostadas integrales con puré de aguacate, tomate y huevo revuelto",
                "ingredients": [
                  {
                    "name": "tostadas integrales",
                    "quantity": "2 unidades"
                  },
                  {
                    "name": "aguacate",
                    "quantity": "1/2 unidad"
                  },
                  {
                    "name": "tomate",
                    "quantity": "1 unidad"
                  },
                  {
                    "name": "huevo",
                    "quantity": "1 unidad"
                  }
                ],
                "macros": {
                  "proteins": 9,
                  "calories": 280,
                  "vitamins": [
                    "A",
                    "E"
                  ],
                  "minerals": [
                    "hierro",
                    "calcio"
                  ]
                }
              },
              {
                "meal_time": "Almuerzo",
                "name": "Lentejas con arroz integral",
                "description": "Estofado de lentejas con arroz integral y ensalada verde",
                "ingredients": [
                  {
                    "name": "lentejas",
                    "quantity": "1 taza"
                  },
                  {
                    "name": "arroz integral",
                    "quantity": "1/2 taza"
                  },
                  {
                    "name": "ensalada verde",
                    "quantity": "1 taza"
                  }
                ],
                "macros": {
                  "proteins": 18,
                  "calories": 320,
                  "vitamins": [
                    "B",
                    "K"
                  ],
                  "minerals": [
                    "hierro",
                    "potasio"
                  ]
                }
              },
              {
                "meal_time": "Cena",
                "name": "Pescado al horno con brócoli",
                "description": "Filete de pescado al horno con limón y acompañado de brócoli al vapor",
                "ingredients": [
                  {
                    "name": "filete de pescado",
                    "quantity": "150g"
                  },
                  {
                    "name": "limón",
                    "quantity": "1/2 unidad"
                  },
                  {
                    "name": "brócoli",
                    "quantity": "1 taza"
                  }
                ],
                "macros": {
                  "proteins": 20,
                  "calories": 300,
                  "vitamins": [
                    "D",
                    "B12"
                  ],
                  "minerals": [
                    "hierro",
                    "calcio"
                  ]
                }
              }
            ]
          },
          {
            "day": "Viernes",
            "meals": [
              {
                "meal_time": "Desayuno",
                "name": "Smoothie de espinacas",
                "description": "Smoothie de espinacas con plátano, piña y leche de almendra",
                "ingredients": [
                  {
                    "name": "espinacas",
                    "quantity": "1 taza"
                  },
                  {
                    "name": "plátano",
                    "quantity": "1 unidad"
                  },
                  {
                    "name": "piña",
                    "quantity": "1/2 taza"
                  },
                  {
                    "name": "leche de almendra",
                    "quantity": "1 vaso"
                  }
                ],
                "macros": {
                  "proteins": 6,
                  "calories": 220,
                  "vitamins": [
                    "A",
                    "C"
                  ],
                  "minerals": [
                    "potasio",
                    "magnesio"
                  ]
                }
              },
              {
                "meal_time": "Almuerzo",
                "name": "Tofu a la plancha con quinoa",
                "description": "Tofu marinado y a la plancha con quinoa y verduras asadas",
                "ingredients": [
                  {
                    "name": "tofu",
                    "quantity": "100g"
                  },
                  {
                    "name": "quinoa",
                    "quantity": "1/2 taza"
                  },
                  {
                    "name": "verduras asadas",
                    "quantity": "1 taza"
                  }
                ],
                "macros": {
                  "proteins": 15,
                  "calories": 280,
                  "vitamins": [
                    "B",
                    "E"
                  ],
                  "minerals": [
                    "hierro",
                    "calcio"
                  ]
                }
              },
              {
                "meal_time": "Cena",
                "name": "Ensalada de atún",
                "description": "Ensalada variada con atún en lata al natural",
                "ingredients": [
                  {
                    "name": "atún en lata",
                    "quantity": "1 lata"
                  },
                  {
                    "name": "lechuga",
                    "quantity": "1 taza"
                  },
                  {
                    "name": "tomate",
                    "quantity": "1 unidad"
                  },
                  {
                    "name": "maíz",
                    "quantity": "1/4 taza"
                  },
                  {
                    "name": "vinagre balsámico",
                    "quantity": "1 cucharada"
                  }
                ],
                "macros": {
                  "proteins": 22,
                  "calories": 320,
                  "vitamins": [
                    "A",
                    "D"
                  ],
                  "minerals": [
                    "potasio",
                    "magnesio"
                  ]
                }
              }
            ]
          }
        ]
      },
      "logprobs": null,
      "finish_reason": "stop"
    }
  ],
  "usage": {
    "prompt_tokens": 664,
    "completion_tokens": 2963,
    "total_tokens": 3627
  },
  "system_fingerprint": null
}
  ''';
