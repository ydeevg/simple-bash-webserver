#!/bin/bash

# Простая функция для отправки HTTP-ответа с текстом "Привет, мир!"
function handle_request {
  echo -ne "HTTP/1.1 200 OK\r\n"
  echo -ne "Content-Length: 21\r\n"
  echo -ne "Content-Type: text/plain\r\n"
  echo -ne "\r\n"
  echo -ne "Привет, мир!"
}

# Запуск сервера на порту 8080
while true; do
  # Ожидание подключения и чтение запроса
  { echo -ne "$(handle_request)"; } | nc -l -p 8080 -q 1;
done