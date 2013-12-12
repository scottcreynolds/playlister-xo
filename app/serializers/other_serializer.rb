class OtherSerializer < ActiveModel::Serializer
  attributes :hi

  def hi
    "hi"
  end
end