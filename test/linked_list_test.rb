require "minitest/autorun"
require "minitest/spec"
require_relative "../lib/linked_list"

class LinkedListTest < Minitest::Test
  extend Minitest::Spec::DSL

  subject { LinkedList.new }

  describe "#delete" do
    describe "when empty" do
      it "doesn't raise an error" do
        subject.delete(1)
      end
    end

    describe "when value exists" do
      before do
        subject.push(1)
        subject.push(2)
        subject.push(3)
      end

      it "changes the size" do
        assert_equal 3, subject.size

        subject.delete(2)

        assert_equal 2, subject.size
      end

      it "deletes the value" do
        subject.delete(2)

        assert_equal 3, subject.pop
        assert_equal 1, subject.pop
      end
    end

    describe "when value does not exist" do
      before do
        subject.push(1)
        subject.push(2)
        subject.push(3)
      end

      it "does not change the size" do
        assert_equal 3, subject.size

        subject.delete(7)

        assert_equal 3, subject.size
      end

      it "does not change the values" do
        subject.delete(7)

        assert_equal 3, subject.pop
        assert_equal 2, subject.pop
        assert_equal 1, subject.pop
      end
    end
  end

  describe "#empty?" do
    describe "when empty" do
      it "returns true" do
        assert_equal true, subject.empty?
      end
    end

    describe "when not empty" do
      before { subject.push(1) }

      it "returns false" do
        assert_equal false, subject.empty?
      end
    end
  end

  describe "#head" do
    it "returns the expected value" do
      subject.push(1)
      subject.push(2)

      assert_equal 2, subject.head.value
    end

    describe "when a next node exists" do
      before do
        subject.push(1)
        subject.push(2)
      end

      it "knows its next node" do
        assert_equal 1, subject.head.next_node.value
      end
    end

    describe "when no next node exists" do
      before do
        subject.push(1)
      end

      it "returns nil as the next node" do
        assert_nil subject.head.next_node
      end
    end
  end

  describe "#include?" do
    describe "when empty" do
      it "returns false" do
        assert_equal false, subject.include?(3)
      end
    end

    describe "when not empty" do
      before do
        subject.push(1)
        subject.push(2)
        subject.push(3)
      end

      it "returns true if value is present" do
        assert_equal true, subject.include?(3)
      end

      it "returns false if value is not present" do
        assert_equal false, subject.include?(7)
      end
    end
  end

  describe "#push and #pop" do
    it "works" do
      subject.push(1)
      subject.push(2)

      assert_equal 2, subject.pop
      assert_equal 1, subject.pop
    end

    it "returns nil when empty" do
      subject.push(1)
      subject.pop

      assert_nil subject.pop
      assert_nil subject.pop
    end
  end

  describe "#size" do
    describe "when empty" do
      it "returns the expected value" do
        assert_equal 0, subject.size
      end
    end

    describe "when not empty" do
      before do
        subject.push(1)
        subject.push(2)
        subject.push(3)
      end

      it "returns the expected value" do
        assert_equal 3, subject.size
      end
    end
  end
end
