abstract class BidirectionalMapper<Entity, Model, Domain> {
  Model fromEntityToModel(Entity entity);

  Domain fromModelToDomain(Model model);

  Model fromDomainToModel(Domain domain);

  Entity fromModelToEntity(Model model);
}