# abs
function abs(x) { return (x < 0) ? -x : x }

# get sign of 'x'
function sign(x) { return x < 0 ? -1 : 1 }

# min
function min(a, b) { return (a < b) ? a : b }

# max
function max(a, b) { return (a > b) ? a : b }

# log base 10 of x
function log10(x) { log(x) / log(10) }

# log base 2 of x
function log2(x) { log(x) / log(2) }

# degree to radian
function d2r(deg) { return deg * atan2(0, -1) / 180 }

# radian to degree
function r2d(rad) { return rad * 180 / atan2(0, -1) }

# get value of pi
function pi() { return atan2(0, -1) }

# hypot 2 numbers
function hypot(x, y) { return sqrt(x ^ 2 + y ^ 2) }

# hypot 3 numbers
function hypot3(x, y, z) { return sqrt(x ^ 2 + y ^ 2 + z ^ 2) }

# calclation by bc(1)
function bc(expr,    cmd, tmp, anser) {
	cmd = "echo '" expr "' | bc -l"
	while (cmd | getline tmp > 0) {
		sub(/\\$/, "", tmp)
		anser = anser tmp
	}
	sub(/^\./, "0.", anser)
	close(cmd)
	return anser
}

# repeat text string
function rep(str, num,     res) { while (num--) res = res str; return res }

# sleep
function sleep(sec,    dummy) { "sleep " sec | getline dummy ; close("sleep " sec) }

# length of multi bytes character string
#function wlength(str) { gsub(/./, "a", str); return blength(str) }

# ascii code --> ascii character
function chr(n, force) {
	if (force) {
		if (n == 0x00) return "[NUL]"
		if (n == 0x01) return "[SOH]"
		if (n == 0x02) return "[STX]"
		if (n == 0x03) return "[ETX]"
		if (n == 0x04) return "[EOT]"
		if (n == 0x05) return "[ENQ]"
		if (n == 0x06) return "[ACK]"
		if (n == 0x0e) return "[SO]"
		if (n == 0x0f) return "[SI]"
		if (n == 0x10) return "[DLE]"
		if (n == 0x11) return "[DC1]"
		if (n == 0x12) return "[DC2]"
		if (n == 0x13) return "[DC3]"
		if (n == 0x14) return "[DC4]"
		if (n == 0x15) return "[NAK]"
		if (n == 0x16) return "[SYN]"
		if (n == 0x17) return "[ETB]"
		if (n == 0x18) return "[CAN]"
		if (n == 0x19) return "[EM]"
		if (n == 0x1a) return "[SUB]"
		if (n == 0x1b) return "[ESC]"
		if (n == 0x1c) return "[FS]"
		if (n == 0x1d) return "[GS]"
		if (n == 0x1e) return "[RS]"
		if (n == 0x1f) return "[US]"
		if (n == 0x7f) return "[DEL]"
	}
	return sprintf("%c", n)
}

# ascii character --> ascii code
function ord(str,    ch, res) {
	ch = substr(str, 1, 1)
	if (res = index(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~", ch))
		return res + 0x1f
	else if (ch == "\a") return 0x07
	else if (ch == "\b") return 0x08
	else if (ch == "\t") return 0x09
	else if (ch == "\n") return 0x0a
	else if (ch == "\v") return 0x0b
	else if (ch == "\f") return 0x0c
	else if (ch == "\r") return 0x0d
	else  return -1
}
