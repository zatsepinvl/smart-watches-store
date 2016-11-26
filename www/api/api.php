<?php
error_reporting(E_ERROR | E_PARSE);
//Credentials
$db_name = 'store';
$db_user = 'root';
$db_password = '';
$admin_name = 'admin';
$admin_password = 'admin';

mb_internal_encoding("UTF-8");
// get the HTTP method, path and body of the request
$method = $_SERVER['REQUEST_METHOD'];

$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
$input = json_decode(file_get_contents('php://input'), true);

// connect to the mysql database
$link = mysqli_connect('localhost', $db_user, $db_password, $db_name);

if (mysqli_connect_errno()) {
    die('Ошибка соединения: ' . mysqli_connect_errno());
}

$link->set_charset("utf8");
mysqli_set_charset($link, 'utf8');

// retrieve the table and key from the path
$table = preg_replace('/[^a-z0-9_]+/i', '', array_shift($request));

$key = array_shift($request) + 0;

// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i', '', array_keys($input));
$values = array_map(function ($value) use ($link) {
    if ($value === null) return null;
    return mysqli_real_escape_string($link, (string)$value);
}, array_values($input));

// build the SET part of the SQL command
$set = '';

for ($i = 0; $i < count($columns); $i++) {
    $set .= ($i > 0 ? ',' : '') . '`' . $columns[$i] . '`=';
    $set .= ($values[$i] === null ? 'NULL' : '"' . $values[$i] . '"');
}


if (($table == 'order') && ($method != 'POST')) {
    if (($_SERVER['PHP_AUTH_USER'] != $admin_name) || ($_SERVER['PHP_AUTH_PW'] != $admin_password)) {
        header('WWW-Authenticate: Basic realm="Enter admin credentials"');
        header('HTTP/1.0 401 Unauthmsdorized');
        echo 'Bad credentials';
        exit;
    }
}

switch ($method) {
    case 'GET':
        $sql = "select * from `$table`" . ($key ? " WHERE " . $table . "_id=$key" : '');
        break;
    case 'PUT':
        $sql = "update `$table` set $set where id=$key";
        break;
    case 'POST':
        $sql = "insert into `$table` set $set";
        break;
    case 'DELETE':
        $sql = "delete $table where id=$key";
        break;
}


// excecute SQL statement
$result = mysqli_query($link, $sql);

// die if SQL statement failed
if (!$result) {
    http_response_code(404);
    die(mysqli_error($link));
}

// print results, insert id or affected row count
if ($method == 'GET') {
    if (!$key) echo '[';
    for ($i = 0; $i < mysqli_num_rows($result); $i++) {
        echo ($i > 0 ? ',' : '') . json_encode(mysqli_fetch_object($result), JSON_UNESCAPED_UNICODE);
    }
    if (!$key) echo ']';
} else if ($method == 'POST') {
    echo mysqli_insert_id($link);
} else {
    echo mysqli_affected_rows($link);
}

// close mysql connection
mysqli_close($link);