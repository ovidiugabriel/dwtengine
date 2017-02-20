{* Smarty test - used to test the grammar *}
{$smarty} {* This should throw an error since 'smarty' is a reserved variable name *}
{$smarty.server.HTTP_HOST} {* smarty.server is a dictionary provided by the server; but not available in command line *}
{* a switch to tell if -cli or -web will be provided to the compiler *}
