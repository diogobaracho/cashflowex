# Bill Account

### mutation

```
mutation(
    $title: String!
      $summary: String
      $is_active: Boolean!
      $initial_value: Float!
  		$user_id: ID!
  ) {
  createBillAccount (
      title: $title
      summary: $summary
      isActive: $is_active
      initialValue: $initial_value
      userId: $user_id
    ) {

      title
      summary
      isActive
      initialValue
    }
}


```

#### variables

```
{
	"title": "conta 1",
	"summary": "sumário",
	"is_active": true,
	"initial_value": 10.5,
	"user_id": 1
}
```


### query


```
   {
    billAccounts {
     title,
      summary,
      isActive,
      initialValue,


    }
  }
```
