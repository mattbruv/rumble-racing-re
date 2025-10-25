
# Given hex value
hex_value =      0x74786620

# Convert to bytes, then decode to string (assuming little-endian)
byte_order = 'little'  # PS2 and x86 use little-endian
byte_order = 'big'  # PS2 and x86 use little-endian
string = hex_value.to_bytes(4, byte_order).decode('ascii')

print(f'"{string}"')
