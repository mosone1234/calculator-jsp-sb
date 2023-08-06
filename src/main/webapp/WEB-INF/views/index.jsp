<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
        <link rel="shortcut icon" type="image/png" href="/favicon.png">
    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous">
    
        <link rel="stylesheet" href="/styles.css">
        <title>Spring Boot + JSP</title>
        <style>
            body{
                background: #666666;
                margin: 0;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            #cal table{
                border-collapse: collapse;
            }

            #cal table{
                height: 400px;
                width: 450px;
            }

            #cal button,
            #cal input{
                width: 100%;
                height: 100%;
                font-size: 1em;
                padding: 10px;
                border: 1px solid black !important;
                border-radius: 8px;
            }

            #cal input{
                padding: 15px;
                color: white;
                border: none;
                background-color: rgba(0, 0, 0, .5);
            }

            #cal input:focus{
                outline: none;
            }

            #cal button{
                background-color: rgba(0, 0, 0, .4);
                border: none;
                color: white;
                font-weight: bold;
                cursor: pointer;
            }

            #cal button:hover{
                background-color: rgba(0, 0, 0, .5);
            }

        </style>
        <script type="text/javascript">
            function handleClick(e) {
                if(e.target.getAttribute('type') === 'button'){
                    if(e.target.className != 'operacion'){
                        document.getElementById('textForm').value += e.target.innerText
                    }
                    if(e.target.id === 'sumar'){
                        document.getElementById('textForm').value += '+'
                    }
                    if(e.target.id === 'igual'){
                        console.log('igual')
                        // CONECTA AL ENDPOINT CALCULAR QUE ESTA EN EL CONTROLADOR CALCULDAORACONTROLLER.JAVA
                        fetch('http://localhost:8080/calcular', 
                            {
                                method: 'POST',
                                headers: {
                                    'Accept': 'application/json',
                                    'Content-Type': 'application/json'
                                },
                                // MANDA EL CUERPO AL ENDPOINT COMO TEXTO PLANO
                                body: JSON.stringify({texto: document.getElementById('textForm').value})
                            }
                        ).then(response => {       
                                return response.json();
                            })
                            .then(data => {
                                console.log(data);
                                document.getElementById('textForm').value = data.response
                            })
                            .catch(error => {
                                console.log(error);
                            });
                    }
                    if(e.target.id === 'restar'){
                        document.getElementById('textForm').value += '-'
                    }
                    if(e.target.id === 'multiplicar'){
                        document.getElementById('textForm').value += '*'
                    }
                    if(e.target.id === 'dividir'){
                        document.getElementById('textForm').value += '/'
                    }
                    if(e.target.id === 'parentesisizq'){
                        document.getElementById('textForm').value += '('
                    }
                    if(e.target.id === 'parentesisder'){
                        document.getElementById('textForm').value += ')'
                    }
                    if(e.target.id === 'punto'){
                        document.getElementById('textForm').value += '.'
                    }
                    if(e.target.id === 'clear'){
                        document.getElementById('cal').reset()
                    }
                }
            }
        </script>
    </head>
    <body>
        <div>
            <form id="cal">
                <table>
                    <tr>
                        <td colspan="4" style="text-align: center; color: white">
                            <div>
                                <h3>CALCULADORA SPRING BOOT</h3>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <input type="text" id="textForm" name="textForm" placeholder="0" style="text-align:right;">
                        </td>
                    </tr>
                    <tr>
                        <td><button type="button" id="clear" class="operacion" onclick="handleClick(event)">C</button></td>
                        <td><button type="button" id="parentesisizq" class="operacion" onclick="handleClick(event)">(</button></td>
                        <td><button type="button" id="parentesisder" class="operacion" onclick="handleClick(event)">)</button></td>
                        <td><button type="button" id="multiplicar" class="operacion" onclick="handleClick(event)">X</button></td>
                    </tr>
                    <tr>
                        <td><button type="button" id="uno" onclick="handleClick(event)">1</button></td>
                        <td><button type="button" id="dos" onclick="handleClick(event)">2</button></td>
                        <td><button type="button" id="tres" onclick="handleClick(event)">3</button></td>
                        <td><button type="button" id="dividir" class="operacion" onclick="handleClick(event)">/</button></td>
                    </tr>
                    <tr>
                        <td><button type="button" id="cuatro" onclick="handleClick(event)">4</button></td>   
                        <td><button type="button" id="cinco" onclick="handleClick(event)">5</button></td>
                        <td><button type="button" id="seis" onclick="handleClick(event)">6</button></td>
                        <td><button type="button" id="sumar" class="operacion" onclick="handleClick(event)">+</button></td>
                    </tr>
                    <tr>
                        <td><button type="button" id="siete" onclick="handleClick(event)">7</button></td>
                        <td><button type="button" id="ocho" onclick="handleClick(event)">8</button></td>
                        <td><button type="button" id="nueve" onclick="handleClick(event)">9</button></td>
                        <td><button type="button" id="restar" class="operacion" onclick="handleClick(event)">-</button></td>
                    </tr>
                    <tr>
                        <td><button type="button" id="cero" onclick="handleClick(event)">0</button></td>
                        <td><button type="button" id="punto" class="operacion" onclick="handleClick(event)">.</button></td>
                        <td colspan="2"><button type="button" id="igual" class="operacion" onclick="handleClick(event)">=</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>