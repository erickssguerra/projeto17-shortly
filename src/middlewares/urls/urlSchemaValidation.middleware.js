import { urlSchema } from "../../schemas/url.schema.js";
import chalk from "chalk";

export function urlSchemaValidation(req, res, next) {
  const { url } = req.body;
  const { error } = urlSchema.validate({ url }, { abortEarly: false });
  if (error) {
    const errors = error.details.map((detail) => detail.message);
    console.log(chalk.red("MW: urlSchemaValidation failed!"));
    return res.status(422).send(errors);
  } else {
    console.log(chalk.yellow("MW: urlSchemaValidation passed..."));
    res.locals.schemaValidatedUrl =  url ;
    next();
  }
}
