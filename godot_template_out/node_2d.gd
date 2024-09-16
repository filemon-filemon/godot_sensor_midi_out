extends Node2D

#define CTRL_CHNG 0xB0

var midi_out = MidiOut.new()
@export var canal = 0xB0
@export var cntrl_nbr_low = 0x1F
@export var cntrl_nbr_high = 0x3F
@export var high_value = 0x7F
@export var low_value = 0x00
@export var val_16000 = 8000

func _ready():
	midi_out.open_port(2)

func _input(_event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_R):
		high_value = val_16000 / 128
		_allumer_led()
	if Input.is_key_pressed(KEY_T):
		low_value = val_16000 * 0
		_eteindre_led()

func _allumer_led():
	print("allumer led")
	midi_out.send_message([canal, cntrl_nbr_low, high_value])
	midi_out.send_message([canal, cntrl_nbr_high, high_value])

func _eteindre_led():
	print("eteindre led")
	midi_out.send_message([canal, cntrl_nbr_low, low_value])
	midi_out.send_message([canal, cntrl_nbr_high, low_value])
