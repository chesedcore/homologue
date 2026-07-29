class_name ParseIterator

const Oops = Err.Oops
const Self = ParseIterator

var source: String
var _currently_parsed_idx := -1
var _source_size_chars := -1

static func from_source(p_source: String) -> Result[Self, Oops] {
	var parser := new()
	return parser._initialise_from_source(p_source)
}

func peek() -> Option[int] {
	return _peek()
}

func walk() -> Option[int] {
	return _walk_engine()
}

func walk_back() -> Option[int] {
	return _walk_engine(true)
}

func get_current_parse_idx() -> int {
	return _currently_parsed_idx
}

func size() -> int {
	return _source_size_chars
}

func has_finished_parsing() -> bool {
	##is at the last token, or beyond that
	return _currently_parsed_idx >= size() - 1
}

func _initialise_from_source(p_source: String) -> Result[Self, Oops] {
	p_source = p_source.strip_edges()
	
	if p_source.is_empty() {
		return Result.err(Oops.SOURCE_PROVIDED_WAS_EMPTY)
	}
	
	source = p_source
	_source_size_chars = p_source.length()
	_currently_parsed_idx = 0
	
	return Result.ok(self)
}

func _can_index(idx: int) -> bool {
	if idx < 0 or idx > size(): return false
	return true
}

func _walk_engine(walk_backwards: bool = false) -> Option[int] {
	if not _can_index(_currently_parsed_idx) {
		return Option.none()
	}
	
	var codepoint := source.unicode_at(_currently_parsed_idx)
	_currently_parsed_idx += -1 if walk_backwards else 1 
	return Option.some(codepoint)
}

func _peek() -> Option[int] {
	if not _can_index(_currently_parsed_idx) {
		return Option.none()
	}
	
	return Option.some(source.unicode_at(_currently_parsed_idx))
}
