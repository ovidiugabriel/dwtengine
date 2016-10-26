
### Comment

```smarty
{* this will work *}
```

### Variables

#### Simple variables
```smarty
{$Name}
```

#### Object member style
```smarty
{$product.part_no} <b>{$product.description}</b>
```

#### Dictionary key style
```smarty
{$Contacts[row].Phone}
```

#### Config variables

```smarty
<body bgcolor="{#bgcolor#}">
```
