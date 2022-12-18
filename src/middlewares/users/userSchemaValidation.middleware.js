import { userSchema } from "../../schemas/user.schema.js";
import chalk from "chalk";

export function userSchemaValidation(req, res, next) {
  const { name, email, password, confirmPassword } = req.body;
  if (password !== confirmPassword) {
    console.log(chalk.red("MW: userSchemaValidation failed!"))
    return res.status(422).send({ message: "Senha não coincide!" });
  }
  const { error } = userSchema.validate(
    { name, email, password },
    { abortEarly: false }
  );
  if (error) {
    const errors = error.details.map((detail) => detail.message);
    console.log(chalk.red("MW: userSchemaValidation failed!"));
    return res.status(422).send(errors);
  } else {
    console.log(chalk.yellow("MW: userSchemaValidation passed..."));
    res.locals.schemaValidatedUser = { name, email, password };
    next();
  }
}
