require 'test_helper'

class ActiveModel::Validations::EmailValidatorTest < ActiveSupport::TestCase
  class TestModel
    include ActiveModel::Validations
    attr_accessor :email
  end

  def setup
    @model = TestModel.new
    @validator = ActiveModel::Validations::EmailValidator.new attributes: :email
  end

  test "add error when contains hash" do
    @model.email = 'chu#ck@testa.com'
    @validator.validate @model

    refute_nil @model.errors[:email]
  end

  test "add error when contains only one TLD" do
    @model.email = 'chuck@testa'
    @validator.validate @model

    refute_nil @model.errors[:email]
  end

  test "add error when contains no TLD" do
    @model.email = 'chuck@'
    @validator.validate @model

    refute_nil @model.errors[:email]
  end

  test "add error when contains a comma" do
    @model.email = 'chu,ck@testa.com'
    @validator.validate @model

    refute_nil @model.errors[:email]
  end

  test "add error when ends with a period" do
    @model.email = 'chu,ck@testa.com.'
    @validator.validate @model

    refute_nil @model.errors[:email]
  end

  test "add error when contains multiple @ symbols" do
    @model.email = 'chu@ck@testa.com'
    @validator.validate @model

    refute_nil @model.errors[:email]
  end

  test "add error when contains no @ symbols" do
    @model.email = 'chucktesta.com'
    @validator.validate @model

    refute_nil @model.errors[:email]
  end

  test "add error when value is empty" do
    @model.email = ''
    @validator.validate @model

    refute_nil @model.errors[:email]
  end

  test "add error when contains spaces" do
    @model.email = 'chu ck@testa.com'
    @validator.validate @model

    refute_nil @model.errors[:email]
  end

  test "add error when contains single-quotes" do
    @model.email = 'chu\'ck@testa.com'
    @validator.validate @model

    refute_nil @model.errors[:email]
  end

  test "add error when contains double-quotes" do
    @model.email = 'chu"ck@testa.com'
    @validator.validate @model

    refute_nil @model.errors[:email]
  end

end