<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des villes</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            max-width: 400px;
        }

        input[type="text"] {
            padding: 12px;
            width: 100%;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        button {
            padding: 12px;
            cursor: pointer;
            background-color: #5bc0de;
            color: #fff;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-size: 14px;
            width: 100%;
        }

        button:hover {
            background-color: #4cae4c;
        }

        h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 20px;
            text-align: center;
        }

        ul {
            list-style-type: none;
            padding: 0;
            width: 100%;
            max-width: 600px;
        }

        li {
            margin-bottom: 20px;
            padding: 20px;
            border: 2px solid #ddd;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        form[action="VilleController"][method="post"] {
            display: flex;
            align-items: center;
            width: 100%;
        }

        form[action="VilleController"][method="post"] button {
            margin-left: 10px;
            background-color: #8B4513; /* Marron clair pour les boutons Supprimer et Modifier */
        }

        form[action="VilleController"][method="post"] button:hover {
            background-color: #A0522D; /* Marron légèrement plus foncé au survol */
        }
    </style>
</head>
<body>

    <form action="VilleController" method="post">
        <h1>Gestion des villes</h1>
        <input type="text" name="ville" placeholder="Nom de la ville" />
        <button type="submit">Enregistrer</button>
    </form>

    <ul>
        <c:forEach items="${villes}" var="v">
            <tr>
                <td>${v.id}</td>
                    <td>${v.nom}</td>
                    <td class="actions">
                <form action="VilleController" method="post">
                    <input type="hidden" name="action" value="delete" />
                    <input type="hidden" name="id" value="${v.id}" />
                    <button type="submit">Supprimer</button>
                </form>
                <script>
        $('#ModifyVilleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var villeId = button.data('ville-id');
            var villeNom = button.data('ville-nom');
            // Ajouter d'autres attributs si nécessaire
            var modal = $(this);

            modal.find('#modalVilleNom').val(villeNom);
            modal.find('#modalVilleId').val(villeId);
            // Mettre à jour d'autres champs si nécessaire
        });

        function submitModifyForm() {
            document.getElementById("modifyForm").submit();
        }
    </script>
               <%--  <%-- <form action="VilleController" method="post">
                    <input type="hidden" name="action" value="modifier" />
                    <input type="hidden" name="ville" value="${v.nom}" />
                    <button type="submit">Modifier</button> 
                </form> --%>
            </tr>
        </c:forEach>
    </ul>
</body>
</html>
