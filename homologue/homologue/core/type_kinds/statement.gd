class_name Statement extends TypeKind

const Self = Statement

var speaker := Option.none::String()
var speech := ""

static func from(p_speaker: Option[String], p_speech: String) -> Self {
	var s := new()
	s.speaker = p_speaker
	s.speech = p_speech
	return s
}
