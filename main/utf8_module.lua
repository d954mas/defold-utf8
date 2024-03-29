-- utf8_module.lua
-- A module that wraps some functions of the utf8 library and includes unit tests

local utf8_module = {}

function test_utf8_offset()
	print("Testing utf8.offset")
	local position = utf8.offset("Hello Lua", 2)  -- This should be the byte position of the second character
	print("Offset position of 2 in 'Hello Lua':", position == 2 and 'Passed' or 'Failed')  -- 'e' in 'Hello' is at position 2
end

function test_utf8_codepoint()
	print("Testing utf8.codepoint")
	local codepoint = utf8.codepoint("Lua", 1)
	print("Codepoint of L in 'Lua':", codepoint == 76 and 'Passed' or 'Failed')
end

function test_utf8_codes()
	print("Testing utf8.codes")
	local s = "Lua"
	local iterator = utf8.codes(s)
	local position, codepoint = iterator(s)
	local valid = position == 1 and codepoint == 76  -- Checking if the first character 'L' of "Lua" is correctly iterated

	print("First codepoint of 'Lua':", valid and 'Passed' or 'Failed')
end


function test_utf8_len()
	print("Testing utf8.len")
	local len = utf8.len("Lua")
	print("Length of 'Lua':", len == 3 and 'Passed' or 'Failed')
end

function test_utf8_sub()
	print("Testing utf8.sub")
	local sub = utf8.sub("Hello Lua", 2, 4)
	print("Substring of 'Hello Lua' from 2 to 4:", sub == "ell" and 'Passed' or 'Failed')
end

function test_utf8_reverse()
	print("Testing utf8.reverse")
	local reversed = utf8.reverse("Lua")
	print("Reversed 'Lua':", reversed == "auL" and 'Passed' or 'Failed')
end

function test_utf8_lower()
	print("Testing utf8.lower")
	local lower = utf8.lower("LUA")
	print("Lowercase 'LUA':", lower == "lua" and 'Passed' or 'Failed')
end

function test_utf8_upper()
	print("Testing utf8.upper")
	local upper = utf8.upper("lua")
	print("Uppercase 'lua':", upper == "LUA" and 'Passed' or 'Failed')
end

function test_utf8_title()
	print("Testing utf8.title")
	local result = utf8.title("hello lua")
	print(result)
	print("Title 'hello lua':", result == "HELLO LUA" and 'Passed' or 'Failed')

	local codepointResult = utf8.title(97)  -- ASCII for 'a'
	print("Title for codepoint 97:", codepointResult == 65 and 'Passed' or 'Failed')  -- ASCII for 'A'
end


function test_utf8_fold()
	print("Testing utf8.fold")
	local folded = utf8.fold("LUA")  -- Assume utf8.fold exists
	print("Folded 'LUA':", folded == "lua" and 'Passed' or 'Failed')
end

function test_utf8_byte()
	print("Testing utf8.byte")
	local byte = utf8.byte("Lua", 1)
	print("Byte of L in 'Lua':", byte == 76 and 'Passed' or 'Failed')
end

function test_utf8_char()
	print("Testing utf8.char")
	local char = utf8.char(76)
	print("Char of 76:", char == "L" and 'Passed' or 'Failed')
end

function test_utf8_escape()
	print("Testing utf8.escape")

	-- Using %ddd where 65 is the decimal code point for 'A'
	local result = utf8.escape("%65")
	print("Escape '%65':", result == "A" and 'Passed' or 'Failed')

	-- Using %{ddd} for the same
	result = utf8.escape("%{65}")
	print("Escape '%{65}':", result == "A" and 'Passed' or 'Failed')

	-- Using %uddd for Unicode
	result = utf8.escape("%u65")
	print("Escape '%u65':", result == "A" and 'Passed' or 'Failed')

	-- Using %u{ddd}
	result = utf8.escape("%u{65}")
	print("Escape '%u{65}':", result == "A" and 'Passed' or 'Failed')

	-- Using %xhhh where 41 is the hexadecimal code point for 'A'
	result = utf8.escape("%x41")
	print("Escape '%x41':", result == "A" and 'Passed' or 'Failed')

	-- Using %x{hhh}
	result = utf8.escape("%x{41}")
	print("Escape '%x{41}':", result == "A" and 'Passed' or 'Failed')

	-- Using %? to escape a character, like !
	result = utf8.escape("%?")
	print("Escape '%?':", result == "?" and 'Passed' or 'Failed')
end

function test_utf8_insert()
	print("Testing utf8.insert")
	local str = utf8.insert("Hello Lua", 7, "World ")  -- Inserting 'World ' at position 7
	print("Insert 'World ' into 'Hello Lua':", str == "Hello World Lua" and 'Passed' or 'Failed')
end

function test_utf8_remove()
	print("Testing utf8.remove")
	local str = utf8.remove("Hello Lua", 6, 9)  -- Removing characters from position 6 to 9
	print("Remove from 6 to 9 in 'Hello Lua':", str == "Hello" and 'Passed' or 'Failed')
end

function test_utf8_charpos()
	print("Testing utf8.charpos")
	local pos = utf8.charpos("Hello Lua", 3)
	print("Char position 3 in 'Hello Lua':", pos == 3 and 'Passed' or 'Failed')
end

function test_utf8_next()
	print("Testing utf8.next")
	local pos = utf8.next("Lua", 1)  -- Assume utf8.next exists
	print("Next position after 1 in 'Lua':", pos == 2 and 'Passed' or 'Failed')
end

function test_utf8_width()
	print("Testing utf8.width")
	local width = utf8.width("Lua")  -- Assume utf8.width exists
	print("Width of 'Lua':", width == 3 and 'Passed' or 'Failed')
end

function test_utf8_widthindex()
	print("Testing utf8.widthindex")
	local index = utf8.widthindex("Hello Lua", 5)  -- Assume utf8.widthindex exists
	print("Width index at 5 in 'Hello Lua':", index == 5 and 'Passed' or 'Failed')
end

function test_utf8_ncasecmp()
	print("Testing utf8.ncasecmp")
	local cmp = utf8.ncasecmp("Lua", "LUA")  -- Assume utf8.ncasecmp exists
	print("Case-insensitive compare 'Lua' and 'LUA':", cmp == 0 and 'Passed' or 'Failed')
end

function test_utf8_find()
	print("Testing utf8.find")
	local startPos, endPos = utf8.find("Lua is great", "great")
	print("Find 'great' in 'Lua is great':", (startPos == 8 and endPos == 12) and 'Passed' or 'Failed')
end

function test_utf8_gmatch()
	print("Testing utf8.gmatch")
	local iterator = utf8.gmatch("Hello Lua User", "%a+")  -- iterator for each word
	local firstResult = iterator()
	print("First word in 'Hello Lua User':", firstResult == "Hello" and 'Passed' or 'Failed')
end

function test_utf8_gsub()
	print("Testing utf8.gsub")
	local result, count = utf8.gsub("Lua is great", "great", "awesome")
	print("Replace 'great' with 'awesome' in 'Lua is great':", result == "Lua is awesome" and 'Passed' or 'Failed')
end

function test_utf8_match()
	print("Testing utf8.match")
	local match = utf8.match("Lua is great", "%a+")
	print("Match first word in 'Lua is great':", match == "Lua" and 'Passed' or 'Failed')
end

function utf8_module.run_tests()
    print("Running utf8 tests...")
    test_utf8_offset()
	test_utf8_codes()
	test_utf8_codepoint()
	test_utf8_len()
	test_utf8_sub()
	test_utf8_reverse()
	test_utf8_lower()
	test_utf8_upper()
	test_utf8_title()
	test_utf8_fold()
	test_utf8_byte()
	test_utf8_char()
	test_utf8_escape()
	test_utf8_insert()
	test_utf8_remove()
	test_utf8_charpos()
	test_utf8_next()
	test_utf8_width()
	test_utf8_widthindex()
	test_utf8_ncasecmp()
	test_utf8_find()
	test_utf8_gmatch()
	test_utf8_gsub()
	test_utf8_match()
    print("utf8 tests completed.")
end

return utf8_module
