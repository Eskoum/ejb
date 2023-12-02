<%@page import="entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Gestion des hôtels</title>
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 20px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 10px;
            width: 300px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        button {
            padding: 10px;
            margin-right: 10px;
            cursor: pointer;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 3px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Nouveaux styles pour la zone Ville */
        select {
            padding: 10px;
            width: 300px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        /* Vous pouvez ajuster ces styles selon vos préférences */
        select:hover {
            border-color: #45a049;
        }

        select:focus {
            border-color: #4caf50;
            box-shadow: 0 0 5px rgba(0, 128, 0, 0.3);
        }
    </style>
</head>
<body>

    <form action="HotelController" method="post">
        Nom : <input type="text" name="nom" /> <br>
        Adresse : <input type="text" name="adresse" /> <br>
        Telephone : <input type="text" name="telephone" /> <br>
        
        <!-- ComboBox pour sélectionner la ville -->
        Ville :
        <select name="villeId">
            <c:forEach items="${Villes}" var="ville">
                <option value="${ville.id}">${ville.nom}</option>
            </c:forEach>
        </select><br>

        <button type="submit" name="action" value="enregistrer">Enregistrer</button>
    </form>

    <h1>Gestion des hôtels :</h1>
    <ul>
        <c:forEach items="${Hotels}" var="h">
            <li>
                ${h.id} - ${h.nom} - ${h.adresse} - ${h.telephone}
                <form action="HotelController" method="post">
                    <input type="hidden" name="action" value="supprimer" />
                    <input type="hidden" name="hotelId" value="${h.id}" />
                    <button type="submit">Supprimer</button>
                </form>
                <form action="HotelController" method="post">
                    <input type="hidden" name="action" value="modifier" />
                    <input type="hidden" name="hotelId" value="${h.id}" />
                    <button type="submit">Modifier</button>
                </form>
            </li>
        </c:forEach>
    </ul>
</body>
</html>
