
The checker validates the templates against rules in a metadata file.

#### Delimiters

I want to be able to specify `left_delimiter` and `right_delimiter`.
For example

```
left_delimiter={{
right_delimiter=}}
```

In this case `{{` will be used instead of `{` and `}}` will be used instead of `}`.

Or

```
left_delimiter=<%
right_delimiter=%>
```

### Comment

```smarty
{* this will work *}

{* this multiline smarty
   comment is
   not sent to browser
*}
```

### Variables

Source Document: https://www.smarty.net/docs/en/language.syntax.variables.tpl

#### Simple variables
```smarty
{$Name}
```

The checker validates the template file only if `$Name` variable is declared in the meta file.

#### Object member style
```smarty
{$product.part_no} <b>{$product.description}</b>
```

The checker validates the template file only if `$product` is an instance of a type that has `part_no` and `description` members.

#### Dictionary key style
```smarty
{$Contacts[row].Phone}
```

#### Vector key style
```smarty
{* display the 5th element of a zero-indexed array *}

{$foo[4]}     
```

#### Variable key value

```smarty
{* display variable key value of an array, similar to PHP $foo[$bar] *}

{$foo.$bar}
```

#### Object Property
```smarty
{* display the object property "bar" *}

{$foo->bar}
```

### Object Method
```smarty
{* display the return value of object method "bar" *}

{$foo->bar()}
```


#### Config variables

```smarty
<body bgcolor="{#bgcolor#}">

{* display the config file variable "foo" *}
{#foo#}

{* synonym for {#foo#} *}
{$smarty.config.foo}
```
The same as _Simple variables_ but the compiler is able to look into the config file where the config variables are defined.

The compiler looks for `{config_load file=...}`, parse the config file and append the configuration variables to metadata, being able to validate config variables usage against config files content.

### Modifiers

#### Modifier to a variable

```smarty
{$title|upper}
```

The checker validates the template file only if `$title` is  declared in the meta file and `upper` (the modififer) is a known modifier.

#### Modifier with parameters

```smarty
{$title|truncate:40:"..."}
```

The checker validates modifier declaration, arity and parameter types against the meta file. To check arity,
it is considered, if the parameter is required/optional and the default value of the parameter.

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
