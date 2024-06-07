class GptPromtConstats {
  static String customExercise() {
    return '''
   A continuacion te enviare informacion de un usuario el cual esta usando nuestra aplicacion de dietas y ejercicios, recuerda muy bien la informacion del usuario, las respuestas deben ser tal cual indican los formatos dados
informacion del usuario :
La edad del usuario es: 21,
        su altura es: 172 cm,
        su peso actual es: 80kg,
        el usuario  cuenta con las siguientes restricciones: sin restricciones,
        ademas cuenta con las siguientes limitaciones: sin limitaciones,
        por ultimo el usuario tiene la siguiente meta objetivo: Reducir de peso
con esta informacion necesito que realices lo siguiente:
Como aclaracion inicial el texto entre paréntesis () solo contiene indicaciones y descripciones; no debe incluirse en la respuesta generada

        Necesito que tomes el rol de un nutricionista experto y genera un plan de alimentacion en forma de dieta. Una comida para cada tiempo del dia: desayuno, almuerzo y cena para 5 dias, es decir de lunes a viernes. El plan de alimentacion debe ser generado en base a las limitaciones y restricciones del usuario. La respuesta que debes retornar es el JSON de formato que te proporciono y nada mas, no un resumen, ni sugerencias.
        A continuacion, te paso un ejemplo del formato en que debes de responder:
        [
            {
                day: 'Lunes', (Dia de la semana)
                meals: [ (Tiempo o comida del dia)
                {
                    meal_time: 'Desayuno', (comida del dia)
                    name: 'Huevo con pan', (nombre de la comida)
                    description: 'un huevo frito con pansito y tesito', (descripcion de la comida con todos su ingredientes)
                    ingredients: [ (debes indicar todos los ingredientes en particular de la comida generada con las siguientes caracteristicas presentes)
                    {
                        name: 'huevo',(nombre del ingrediente)
                        quantity: '2 huevos', (cantidad de los ingredientes en la comida)
                    },
                    {
                        name: 'pan',(nombre del ingrediente)
                        quantity: '2 panes',(cantidad de los ingredientes en la comida)
                    }
                    ],
                    macros: { (Informacion de macronutrientes de la comida en general)
                    proteins: 10, (proteinas totales de la comida, ademas añade la unidad, es decir 10 gr por ejemplo)
                    calories: 10, (calorias totales de la comida, ademas añade la unidad, es decir 10 cal por ejemplo)
                    vitamins: ['A', 'B', 'C', 'D'], (Vitaminas que provee la comida)
                    minerals: ['M1', 'M2', 'M3', 'M4'] (Minerales que proporciona la comida)
                    }
                },
            }
        ]
        Genera solo el JSON en formato que te proporciono, nos añadas ni agregues cosas extra
    ''';

    // return '''
    // Debes ponerte en el rol de un entrenador personal y ser bastante serio, ya que hay factores que deberás tener en cuenta del cliente que atenderás. Se le consultó al cliente lo siguiente:
    // Altura: 174 cm
    // Edad: 21 años
    // Peso: 110 kilos
    // Género: masculino
    // Impedimentos: ninguna
    // Teniendo en cuenta los aspectos que te di de la persona, necesito que me generes un objeto de la siguiente manera y de esa manera para cada día de la semana en formato JSON.
    // este debe ser para todos los dias de la semana, empezando por el lunes y terminando el viernes y recuerda que cada campo que sea un String porfavor y que todos los ejercicios sean de fuerza nada de cardio y solo dame el JSON nada mas,
    // tomatelo en serio, ya que es un tema muy delicado:
    // ejemplo:
    //   "rutina": [
    //   {
    //     "dia": "lunes",
    //     "ejercicios": [
    //       {
    //         "nombre": "Ejercicio 1",
    //         "descripcion": "Descripción del ejercicio 1",
    //         "tipo": "Cardio",
    //         "objetivo": "Mejorar la resistencia cardiovascular",
    //         "series": "3 series",
    //         "repeticiones": "10 repeticiones",
    //         "descanso": "30 segundos",
    //       },
    //       {
    //         "nombre": "Ejercicio 2",
    //         "descripcion": "Descripción del ejercicio 2",
    //         "tipo": "Fuerza",
    //         "objetivo": "Fortalecer los músculos del pecho",
    //         "series": "3",
    //         "repeticiones": "12",
    //         "descanso": "30",
    //       },
    //     ]
    //   },
    // ]
    // ''';
  }

  static String customDiet() {
    return '''
    Debes ponerte en el rol de un nutricionista y ser bastante serio, ya que hay factores que deberás tener en cuenta del paciente que atenderás. Se le consultó al paciente lo siguiente:
    Altura: 174 cm
    Edad: 21 años
    Peso: 110 kilos
    Género: masculino
    Alergias: ninguna
    Enfermedades: ninguna
    De esa manera para cada día de la semana en formato JSON.
    este debe ser para todos los dias de la semana, empezando por el lunes y terminando el viernes
    Teniendo en cuenta los aspectos que te di de las personas, necesito que me generes un objeto de la siguiente manera y solo retorname el JSON:
    comidas: [
                {
                  day: "lunes",
                  meals: [
                    {
                      meal: "Desayuno",
                      description: "2 huevos, 1 taza de avena, 1 plátano",
                      calories: "400",
                      proteins: 20,
                    },
                    {
                      meal: "Almuerzo",
                      description: "1 pechuga de pollo, 1 taza de arroz, 1 taza de brócoli",
                      calories: "500",
                      proteins: "25",
                    },
                    {
                      meal: "Cena",
                      description: "1 pechuga de pollo, 1 taza de arroz, 1 taza de brócoli",
                      calories: "500",
                      proteins: "25",
                    },
                  ]
                },
              ]
    ''';
  }
}
