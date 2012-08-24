Mozilla Intern Presentation Text
================================
Part 1
------
If you're channel-surfing Air Mozilla, or just stopped by Ten Forward for a bowl of cereal, and are deciding if you want to stick around for the entire presentation, here's what I'm going to be talking about today:

- instrumenting and visualizing metrics
  for the Mozilla Persona user interface
- disposable email addresses
  for sites that don't use Persona and those that do
- managing your passwords
  see how you're doing and act on it

But before I talk about any of these, I should probably introduce myself. Hi! I'm Nathan, but some call me Nate, there are some who know me as nmalkin, and some who know me as nmalkin@mozilla.com.

Admittedly, it's not often that you'll hear someone on the street go, "yo, nmalkin@mozilla.com!" But on the Internet, where, let's face it, I spend most of my time, my email address *is* my primary form of identity.

Why? Well, what else is there?

There are usernames/nicknames, but these can be easily changed and aren't portable across websites.

Then, there's been the recent push by sites like Facebook, Google, and Quora for us to all use our real names online. But that's not easily enforceable. If you think about it, the one thing these sites know about you for certain is your email address.

How? Because when you signed up, they sent you a message to verify it. And so did everybody else — from Twitter to the New York Times. And while they were at it, they made you come up with a password. Which is how we ended up in our current situation, with too many emails and too many passwords.

Now, as a consumer, this sucks. I can't just log in to a new site; I have to sign up, create an account, fill in my email, create a password, go check my email, and only then can I log in to the site. And, I have to keep track of a bunch of passwords.

It's not great for a site, either. They lose valuable customers as they try to funnel them through a sign-up flow.[1] And, they have to keep track of a bunch of passwords. If you think that's easy, go ask LinkedIn or eHarmony or Sony or ... — you get the picture

So, say you have a site, and I come to your site, and you want to verify my identity, but want to avoid this mess, what can you do?

You could ask someone to vouch for me. Somebody who knows me really, really well. Facebook!
So you could ask Mark Zuckerberg, "hey, do you know this Nathan character?" and he'd be, like, "yeah, dude, he's cool," so you'd let me in.
This is the principle behind Facebook Connect. Google, Microsoft, Twitter, Yahoo and others all have versions of this.

So, this is nice and convenient. What's the issue?

Maybe I don't have a Facebook account. But now that everybody and their cow has one, let's say this is not an issue.

Maybe I don't want Mark Zuckerberg to know which sites I visit and how often I sign in to them. After all, the man already knows who's been poking me; isn't that enough?
    "Love/hate relationship with Facebook. I purposefully try not to use any app that runs through the site." - "Chelsea"

And, as a site owner, you might be worried about having all your accounts with Facebook, in case they one day disappear and take all their users with them.

This is where Persona comes in. It achieves the same results — verified identities, outsourced password handling — but does it differently.

The idea behind it is kind of like having your ID checked at a bar. Your browser gets a certificate from your email provider that says you are who you say you are. The site checks if that certificate is valid, and that it was issued to you, not somebody else. And it does that without asking your email provider about you specifically. Just like the government doesn't find out about which bars you visited. It's between you and the site. And your browser.

Notice that, in this interaction, there are no intermediaries. Not Mozilla, not anybody.

In reality, though, it's a little more complicated. Because your email provider might not issue these certificates. And your browser might not know what to do with them. But we still want everybody to be able to sign in!

The solution is a set of fallback services, which Mozilla provides, but anybody can host. Your browser doesn't support Persona? We'll pop open a window with an HTML page that will guide you through the flow. Your email provider doesn't talk Persona? We'll verify your email address once, for all sites, and then you'll never have to do it again.

So, surrounding this simple principle, we have a pretty complicated process, with a number of different flows that users might have to follow. The good news is that, at this stage, we have direct control over the user experience. The somber news is that we have to get it exactly right.

As a cautionary tale, consider OpenID. Like Persona, it's supposed to be a federated single sign-on service. It's been around for several years now, but nobody uses it. Why? Part of the reason, we think, is a confusing user experience.

So, how do we know if we're getting it right? We want to be able to answer basic questions, like

- Are people able to successfully use the service?

We can decompose this into a few, more specific questions:

- Can new users sign up?
- Are they able to use multiple email addresses?
- If they forgot their password, can they reset it?

Going deeper, we want to be able to answer the question

- If not, why? Where are we losing people?
- Who are we losing? Specific locales? Specific technologies?

And, finally, it's important to understand

- How does this change over time?

For example, recently, we went through a rebrand, as BrowserID became Persona. A lot of the UI changed in the process. Did we inadvertently introduce changes that hurt user engagement?

How can we answer these questions?

The first step is to start collecting data that can help us answer these questions.

We want to know what is happening to the user, so we collect events. What does the user see? When?
Examples:

- enter password screen at 7 seconds
- verification email sent at 16 seconds
- email verified at 31 seconds

How do we keep track of these events?
Save them in local storage as they occur.

Okay, so the data is in local storage. How do we find out about it?
The data from the previous interaction is sent over the next time the Persona dialog is opened.

Where is the data sent?
To the KPI data store. "KPIggybank"

What does it do there?
Stay.

And then what?
We analyze it!

Go back to answering the questions.

- Can new users sign up?
- If not, why? Where are we losing people?
- If they forgot their password, can they reset it?
- ...

[1]: http://www.lukew.com/ff/entry.asp?1128 "Gradual Engagement Boosts Twitter Sign-Ups by 29%"


