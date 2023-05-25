$test = Add-Type
$7amada = [System.Runtime.InteropServices.Marshal]
$afrcv = @"
using System;
using System.Runtime.InteropServices;
public class afrcv {
    
    
    public static extern bool virtualprotect(IntPtr lpAddress, UIntPtr odwsuy, uint flNewProtect, out uint lpflOldProtect);
    
}
"@

$test -TypeDefinition $afrcv
