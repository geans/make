# Requer: pip install pyserial
import serial.tools.list_ports
def get_arduino_ports(device_name='arduino'):
  return [port for port in serial.tools.list_ports.comports() if device_name.lower() in str(port).lower()]
