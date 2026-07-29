class_name Parser

const Oops = Err.Oops
const Self = Parser

var source_iter: ParseIterator

static func from_source(source: String) -> Result[Self, Oops] {
	return new()._initialise_from_source(source)
}

func _initialise_from_source(source: String) -> Result[Self, Oops] {
	var iter := ParseIterator.from_source(source)
	if iter.is_err() {
		return Result.err(iter.unwrap_err_unchecked())
	}
	
	source_iter = iter.unwrap_unchecked()
	return Result.ok(self)
}

func _keep_parsing_until_errors() -> Array[TypeKind] {
	while not source_iter.has_finished_parsing() {
		assert(false)
	}
	return []
}

func _parse_statement() -> Option[TypeKind] {
	while true {
		var next_lexeme := source_iter.walk()
		if next_lexeme.is_none(): return Option.none()
		
		match next_lexeme.unwrap_unchecked() {
			
		}
	}
	return Option.none()
}
