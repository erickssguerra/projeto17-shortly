import chalk from "chalk";

export async function isUserAuthor(req, res, next) {
  const userId = res.locals.authorizedUserId;
  const urlObject = res.locals.existingId;
  if (userId !== urlObject.userId) {
    console.log(chalk.red("MW: isUserAuthor failed!"));
    return res
      .status(401)
      .send({ message: "Usuário não é o autor da Url!" });
  } else {
    console.log(chalk.yellow("MW: isUserAuthor passed..."));
    res.locals.authorizationToDelete = urlObject.id;
  }
  next();
}
