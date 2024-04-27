<?php

// Obtener todas las variables de entorno
// $servername = $_ENV['DB_HOST'];       //"mariadb";
// $database = $_ENV['DB_NAME'];         //"mydatabasedg";
// $username = $_ENV['USER1'];           //"dbking";
// $password = $_ENV['USER1_PASSWORD'];  //"dgarizad";

$servername = "mariadb";      
$database = "mydatabasedg";         
$username = "dbking";           
$password = "dgarizad";       


// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);

// Check connection
if (!$conn)
    die("Connection failed: " . mysqli_connect_error());

echo "Connected successfully<br>";

// Consulta usuarios
$result = $conn->query("SELECT User FROM mysql.user;");

// Verificar si se ejecutó correctamente la consulta
if ($result->num_rows > 0)
{
    while($row = $result->fetch_assoc())
        echo "ID: " . $row["User"] . "<br>";
}
else
    echo "0 resultados<br>";

// Consulta databases
$result = $conn->query("SHOW DATABASES");

// Verificar si se ejecutó correctamente la consulta
if ($result->num_rows > 0)
{
    while($row = $result->fetch_assoc())
        echo "Database: " . $row["Database"] . "<br>";
}
else
    echo "No se encontraron bases de datos.";

mysqli_close($conn);
?>