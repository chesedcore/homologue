extends Node

func _ready() -> void {
	var source := " "
	var parser := Parser.from_source(source).expect_enum(Err.Oops)
}
