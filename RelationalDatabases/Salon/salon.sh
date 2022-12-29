#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\nWelcome to my salon, how can I help you?"
SERVICES_OFFERED=$($PSQL "SELECT service_id, name FROM services") 

SERVICE_MENU(){
  if [[ ! -z $1 ]]
    then
    echo -e "\n$1"
  fi
  echo -e $SERVICES_OFFERED | sed 's/ |/)/g' | sed -r 's/[0-9]+\)/\n&/g'
}

SERVICE_MENU

#read service_id and find service name
read SERVICE_ID_SELECTED
SERVICE_SELECTED=$($PSQL "SELECT name from services WHERE service_id=$SERVICE_ID_SELECTED")

# if chosen service dosen't exist
while [[ -z $SERVICE_SELECTED ]]
  do
  # return to service menu and read selection
  SERVICE_MENU "I could not find that service, what would you like today?"
  read SERVICE_ID_SELECTED
  SERVICE_SELECTED=$($PSQL "SELECT name from services WHERE service_id=$SERVICE_ID_SELECTED")
done

# get customer phone number
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_PHONE_RESULT=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

# if not a customer
if [[ -z $CUSTOMER_PHONE_RESULT ]]
  then
  # get customer name
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME

  # enter new customer
  ENTER_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

# get customer id and name
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# get service time
echo -e "\nWhat time would you like your $(echo $SERVICE_SELECTED | tr '[:upper:]' '[:lower:]'), $(echo $CUSTOMER_NAME)?"
read SERVICE_TIME

# create appointment
ENTER_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
echo -e "\nI have put you down for a $(echo $SERVICE_SELECTED) at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."









