require 'test_helper'

class TestQuerySelection < MiniTest::Unit::TestCase
  def test_parse_single_field
    selection = SkyDB::Query::Selection.parse("foo")
    assert_equal 1, selection.fields.length
    assert_equal "foo", selection.fields[0].expression
  end

  def test_parse_multiple_fields
    selection = SkyDB::Query::Selection.parse("  foo  , bar, baz_12  ")
    assert_equal 3, selection.fields.length
    assert_equal "foo", selection.fields[0].expression
    assert_equal "bar", selection.fields[1].expression
    assert_equal "baz_12", selection.fields[2].expression
  end

  def test_parse_aliased_fields
    selection = SkyDB::Query::Selection.parse("foo bar, baz bat")
    assert_equal 2, selection.fields.length
    assert_equal "foo", selection.fields[0].expression
    assert_equal "bar", selection.fields[0].alias_name
    assert_equal "baz", selection.fields[1].expression
    assert_equal "bat", selection.fields[1].alias_name
  end
end