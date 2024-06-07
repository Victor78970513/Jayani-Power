import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jayani_power/models/custom_diet_model.dart';
import 'package:jayani_power/models/custom_exercises_model.dart';
import 'package:jayani_power/repositories/custom_plans/custom_plans_repository.dart';
import 'package:dio/dio.dart';

class CustomPLansRepositoryImpl extends CustomPlansRepository {
  Dio dio = Dio();

  final gptResponse = '''
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

  mapping() {
    final newJson = json.decode(gptResponse);
    // final message = newJson['choices']['messsage']['content'];
    final message = newJson['choices'][0]["message"]['content'][0]["meals"][0]
        ['ingredients'][0]['name'];
    log(message.toString());
  }

  Future<Response<dynamic>> gptApiCall(prompt) async {
    return await dio.post("https://api.openai.com/v1/chat/completions",
        options: Options(headers: {
          'Authorization': 'Bearer ${dotenv.env['GPT_TOKEN']}',
        }),
        data: {
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "system",
              "content": prompt,
            }
          ]
        });
  }

  @override
  Future<List<CustomExercisesModel>?> generateCustomExercises(
      String prompt) async {
    try {
      // final response = await gptApiCall(prompt);
      // await dio.post("https://api.openai.com/v1/chat/completions",
      //     options: Options(headers: {
      //       'Authorization': 'Bearer ${dotenv.env['GPT_TOKEN']}',
      //     }),
      //     data: {
      //   "model": "gpt-3.5-turbo",
      //   "messages": [
      //     {
      //       "role": "system",
      //       "content": prompt,
      //     }
      //   ]
      // });

      // log(response.data.toString());
      // List<Exercise> ejercicios = [];
      final List<CustomExercisesModel> customExercisesModel = [];
      // final List<dynamic> choices = response.data['choices'];
      // for (final choice in choices) {
      //   final messageContent = jsonDecode(choice['message']['content']);
      //   for (final rutina in messageContent['rutina']) {
      //     for (final exercise in rutina['ejercicios']) {
      //       final ejercicio = Exercise(
      //         name: exercise["nombre"] ?? "",
      //         description: exercise["descripcion"] ?? "",
      //         type: exercise['tipo'] ?? "",
      //         objective: exercise['objetivo'] ?? "",
      //         series: exercise['series'] ?? "",
      //         repes: exercise['repeticiones'] ?? "",
      //         descanso: exercise['descanso'] ?? "",
      //       );
      //       ejercicios.add(ejercicio);
      //     }
      //     final custom =
      //         CustomExercisesModel(day: rutina['dia'], exercises: ejercicios);
      //     customExercisesModel.add(custom);
      //     ejercicios = [];
      //   }
      // }
      return customExercisesModel;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<List<CustomDietModel>?> generateCustomDiet(String prompt) async {
    try {
      final response =
          await dio.post("https://api.openai.com/v1/chat/completions",
              options: Options(headers: {
                'Authorization': 'Bearer ${dotenv.env['GPT_TOKEN']}',
              }),
              data: {
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content": prompt,
              }
            ]
          });

      List<Plate> plates = [];
      final List<CustomDietModel> customDietModel = [];
      final List<dynamic> choices = response.data['choices'];
      for (final choice in choices) {
        final messageContent = jsonDecode(choice['message']['content']);
        for (final meals in messageContent['comidas']) {
          for (final meal in meals['meals']) {
            final plato = Plate(
              meal: meal['meal'] ?? "no meal",
              description: meal['description'] ?? "no description",
              calories: meal['calories'] ?? "no calories",
              proteins: meal['proteins'] ?? "no proteins",
            );
            plates.add(plato);
          }
          final custom = CustomDietModel(day: meals["day"], plates: plates);
          ;
          customDietModel.add(custom);
          plates = [];
        }
      }
      return customDietModel;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
