# Over-Engineering an Oil Tank Gauge

2020-09-09

I almost went down the path of investing a huge amount of time and effort into fixing a stuck oil fuel tank float-gauge in my house. Recently, the float mechanism became stuck and permanently displayed `empty` regardless of how much fuel was in the tank - not ideal. It's a 20 year-old tank, so I wasn't surprised that the float finally gave out. 

Being the wannabe tinkerer that I am, a light bulb went off in my head and I started thinking on how to incorporate some ultrasonic system to display the accurate fuel reading digitally. Obviously my first thought was just to replace the float gauge with a new one and be done with it. That didn't sound very *fun* though.

I briefly looked at other similar projects and started brainstorming the best way I would implement this for my own situation. The best option I came across seemed to be this: [DIY Ultrasonic Fuel Gauge / Level Sensor](https://scottiestech.info/2017/10/24/diy-ultrasonic-fuel-gauge-level-sensor/)

An ultrasonic system with a cool mini display sounded pretty rad - much cooler than just replacing the broken gauge with a new float arm. So it was settled.

## My oil think-tank

I quickly thought through my options in my head before jumping too far into things (and even included a "poor-mans" temperature strip option):

| Solution | Cost | Time |
|--------|-----------------|----------|
| Ultrasonic Gauge | $40-50 | ~2-3 hours |
| New Float Gauge | $25-30 | ~45 minutes |
| Temperature Strips | $10 | ~2 minutes |

My mind was still set on building and implementing the ultrasonic option. It would be a great learning experience at the very least!

So, before I ordered any parts or started designing a case that would house this new super-cool device, I went to investigate/remove the float gauge to get a better look at the damage. With the help of some penetrating oil (the original installer went crazy with the pipe dope) and my trusty wrench, I opened up the gauge cap, partly lifting the float from the tank. Right away I noticed that the float and shaft were slightly stuck together in one small area. I poked it with my finger.

*The float set itself back into the correct position. It was fixed.*

How could I have been so dumb. I was so excited about *building something* that I jumped into implementation before fully realizing the problem. Talk about a metaphor for web dev, am I right?

## Overthinking simple problems

I can't speak for all designers / developers out there, but I catch myself (far more often than I'd like to admit) over-engineering a solution because of some perceived notion that it is the "best" option. Most of the time it isn't actually better, it just seems more *fun*.

Now don't get me wrong, fun is a good thing most of the time. It's just that some instances call for the quickest, cleanest, easiest solution in the name of efficiency - just be sure to have fully explored the problem *first*.

## Final decision

So I ended up doing nothing. I simply re-threaded the cap and placed the float back inside the tank. I know I saved myself time and money, but I can't help but feel like I failed...

Just like in the world of software, it's best to avoid over-engineering simple problems.
