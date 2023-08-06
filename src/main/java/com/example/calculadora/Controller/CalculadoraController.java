package com.example.calculadora.Controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.calculadora.model.Calculadora;

@RestController
public class CalculadoraController {

    // PRUEBA DE ENDPOINT
    @RequestMapping(value = "/calcular", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> sayHello () {
        return new ResponseEntity<>("{\"success\":1}", HttpStatus.OK);
    }

    // CALCULAR OPERACION
    @RequestMapping(value = "/calcular", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> adicionarVariable (@RequestBody Calculadora calculadora) {
        System.out.println("Operation : " + calculadora.getTexto());
        String text = "{\"response\":\"data\"}";
        String newResponse = text.replace("data", calculadora.getTexto());
        return new ResponseEntity<>(newResponse, HttpStatus.OK);
    }
}
