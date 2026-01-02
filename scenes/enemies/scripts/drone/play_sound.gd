## This script is for playing sound effects

## Enter the sound using export
## call method limbo ai
## Input node name
## Input play sound func name 

extends Node

signal owner_signal
@export var sound_effect : AudioStreamPlayer2D

func play_sound():
    sound_effect.play()
    owner_signal.emit(owner)
    
    
    
    
    
    
    
    
    
    
