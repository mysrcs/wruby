# Avoiding Featurism

2022-10-14

I rather enjoy the term "featurism". I came across this term while reading the wonderful article [Why I don't use Netscape](https://www.complang.tuwien.ac.at/anton/why-ancient-browsers.html), which the author credits to Bernd Paysan. Although it sums up the current "digital product" industry quite well the more specific terminology, *creeping featurism*, works better:

> **creeping featurism** (*noun*)
>
> A condition in which one or more people, often in the form of a committee, progressively increase the scope and complexity of a project until the project is deemed infeasible and subsequently cancelled to the detriment of all involved.

Throughout my career of designing and developing software I have run into this exact issue far too often. The major issue with getting sucked into a black-hole of "featurism" is there is no single person to blame. It probably seems easy to place all the responsibility on PMs or team leaders, but even *if* they are the ones adding excessive complexity to a given project, it is the role of developers and designers to speak up. It requires a team effort. Therefore, the *whole team* needs to be on-guard to avoid it.

### Simple Guidelines

These "tips" are not perfect, nor will they work for every work environment. Hopefully they can at least be used as basic guidelines and expanded upon from there.

- Explore the feature's *benefit* to the product. You need to confirm that this addition will be a net-positive for both customers and your bottom-line.
- All team members assigned to a feature need to scope it out. Far too often I see feature sets that require design input being estimated solely by developers and vice versa.
- Radically limit the scope of each individual task[^1]. Each task should be clear-cut, bite-sized and look almost trivial.
- Lock-in tickets. Once they are agreed upon they **cannot** be altered[^2]. Anything that absolutely *needs* to be added should become a future ticket itself.
- Follow-up with feature reviews. When a sprint or milestone is reached, it is important to reflect on what worked and what didn't. Call out any instances where the team steered away from the guidelines above.

That's it. Just a nice, simple baseline to branch off from to avoid "featurism". Some items listed won't make sense for certain teams and that's okay. If you take the time to at least reflect on your feature workflow, I guarantee you'll find areas to improve.

Creeping featurism can kill your product and the morale of your team. Avoid it like the plague!

[^1]: This is easier said than done. Normally you will need to have developed some form of "point system" internally, so you know how to effectively divide features.
[^2]: *Taking away* complexity, making changes that do not impact workload or reducing the ticket is fine - within reason.