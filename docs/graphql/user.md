# USER

### mutation

```
mutation createUser(
  $user_login: String!
  $password: String!
  $email: String!
  $role_id: Int
  $role_name: String
  $group_id: Int
  $prefix: String
  $firstname: String
  $middlename: String
  $lastname: String
  $suffix: String
  $dob: String
  $gender: Int
  $taxvat: String!
  $celphone: String
  $phone: String
  $is_subscribed: String
) {
  createUser(
    userLogin: $user_login
    password: $password
    email: $email
    roleId: $role_id
    roleName: $role_name
    groupId: $group_id
    prefix: $prefix
    firstname: $firstname
    middlename: $middlename
    lastname: $lastname
    suffix: $suffix
    dob: $dob
    gender: $gender
    taxvat: $taxvat
    celphone: $celphone
    phone: $phone
    isSubscribed: $is_subscribed

  ){
    email
  }
}
```

#### variables

```
{
	"user_login": "t@t.com.br",
	"password": "mudar123",
	"email": "t@t.com.br",
	"role_id": 2,
	"role_name": "role-name",
	"group_id": 2,
	"prefix": "sr",
	"firstname": "diogo",
	"middlename": "santos",
	"lastname": "baracho",
	"suffix": "sufixo",
	"dob": "1985-09-09 00:00:00",
	"gender": 1,
	"taxvat": "35947019809",
	"celphone": "11996644601",
	"phone": "12348765",
	"is_subscribed": "1"
}
```


### query


```
  {
    users {
      id
      groupId
      userLogin
      email
      roleId
      roleName
      groupId
      prefix
      firstname
      middlename
      lastname
      suffix
      dob
      gender
      taxvat
      celphone
      phone
      isSubscribed
    }
  }
```
