
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
### Modifiers

#### modifier to a variable

```smarty
{$title|upper}
```

#### modifier with parameters

```smarty
{$title|truncate:40:"..."}
```
#### modifier to a function parameter

```smarty
{html_table loop=$myvar|upper}
```

#### modifier with parameters to a function parameter

```smarty
{html_table loop=$myvar|truncate:40:"..."}
```

#### modifier to literal string

```smarty
{"foobar"|upper}
```

#### modifier to a custom function

```smarty
{mailto|upper address="smarty@example.com"}
```

#### modifiers on array

```smarty
{* this will uppercase and truncate the whole array *}
<select name="name_id">
{html_options output=$my_array|upper|truncate:20}
</select>
```
### Variable assignment

####  Simple assignment

```smarty
{$name='Bob'}
```

#### Assignment with math

```smarty
{$running_total=$running_total+$some_array[row].some_value}
```

#### Assignment of an array element

```smarty
{$user.name="Bob"}
```

#### Assignment of an multidimensional array element

```smarty
{$user.name.first="Bob"}
```
#### Appending an array

```smarty
{$users[]="Bob"}
```
