class GptPromtConstats {
  static String customExercise() {
    return '''
    Debes ponerte en el rol de un entrenador personal y ser bastante serio, ya que hay factores que deberás tener en cuenta del cliente que atenderás. Se le consultó al cliente lo siguiente:
    Altura: 174 cm
    Edad: 21 años
    Peso: 110 kilos
    Género: masculino
    Impedimentos: ninguna
    Teniendo en cuenta los aspectos que te di de la persona, necesito que me generes un objeto de la siguiente manera y de esa manera para cada día de la semana en formato JSON.
    este debe ser para todos los dias de la semana, empezando por el lunes y terminando el viernes y recuerda que cada campo que sea un String porfavor y que todos los ejercicios sean de fuerza nada de cardio y solo dame el JSON nada mas,
    tomatelo en serio, ya que es un tema muy delicado:
    ejemplo:
      "rutina": [
      {
        "dia": "lunes",
        "ejercicios": [
          {
            "nombre": "Ejercicio 1",
            "descripcion": "Descripción del ejercicio 1",
            "tipo": "Cardio",
            "objetivo": "Mejorar la resistencia cardiovascular",
            "series": "3",
            "repeticiones": "10",
            "descanso": "30",
          },
          {
            "nombre": "Ejercicio 2",
            "descripcion": "Descripción del ejercicio 2",
            "tipo": "Fuerza",
            "objetivo": "Fortalecer los músculos del pecho",
            "series": "3",
            "repeticiones": "12",
            "descanso": "30",
          },
        ]
      },
    ]
    ''';
  }
}