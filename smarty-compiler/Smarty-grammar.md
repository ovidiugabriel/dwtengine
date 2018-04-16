
### Comment

```smarty
{* this will work *}

{* this multiline smarty
   comment is
   not sent to browser
*}
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

#### Modifier to a variable

```smarty
{$title|upper}
```

#### Modifier with parameters

```smarty
{$title|truncate:40:"..."}
```
#### Modifier to a function parameter

```smarty
{html_table loop=$myvar|upper}
```

#### Modifier with parameters to a function parameter

```smarty
{html_table loop=$myvar|truncate:40:"..."}
```

#### Modifier to literal string

```smarty
{"foobar"|upper}
```

#### Modifier to a custom function

```smarty
{mailto|upper address="smarty@example.com"}
```

#### Modifiers on array

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

### Iterators

```smarty
{* output empty row on the 4th iteration (when index is 3) *}

<table>
{foreach $items as $i}
  {if $i@index eq 3}
     {* put empty table row *}
     <tr><td>nbsp;</td></tr>
  {/if}
  <tr><td>{$i.label}</td></tr>
{/foreach}
</table>
```
