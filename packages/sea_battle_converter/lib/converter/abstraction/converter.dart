abstract class Converter<DataHolder, ResultType> {
  DataHolder? serialize(ResultType? object);

  ResultType? deserialize(DataHolder? object);
}