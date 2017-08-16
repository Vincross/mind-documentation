# Skill Store

The Skill Store is where HEXA developers can share their Skills. Even if you're not a developer, you can test and try out new applications for your HEXA here. We built the Skill Store to be similar to an "app store" in the sense that you can browse and install other applications that people have created, allowing you to expand HEXA's capabilities without having to write a single line of code.

Download the [Skill Store app](https://www.vincross.com/skill-store) that matches your device so you can find new skills and add your own.

# How to add your Skill to the Store

To publish a Skill on the Store, you need to get a unique Skill ID provided by Vincross. To do this, you'll need to create a Vincross account. After that, you can log in to the [Developer Bridge](https://developer.vincross.com/bridge) and initialize your Skill there.

Note: While it's okay to use any string as your Skill ID while testing, you'll need to use the official Skill ID in order to distribute your application.

Here's how to get your Skill ID:

## 1\) Log in to the Developer Bridge

Navigate to [https://developer.vincross.com/bridge](https://developer.vincross.com/bridge) and create an account if you don't have one already.

When you log in, select the 'Skill' option from the menu on the sidebar.

![](/assets/Screen Shot 2017-08-14 at 4.12.51 PM.png)

## 2\) Create a Skill

Select 'Create a Skill.' Fill in your Skill's name, choose an icon, and enter the version number at the prompts. Then hit 'Create.'

![](/assets/Screen Shot 2017-08-14 at 4.13.56 PM.png)

## 3\) Copy the Skill ID into your Manifest

When you create your skill, you should get a pop up containing your Skill ID. Be sure to note it down, you'll need it later.

Navigate to `manifest.json` in your Skill's package and enter it there. Make sure the information such as `name` and `version` matches what you entered on the Developer Bridge.

```json
{
 "name": "myskill",
 "skillID": "enter_your_skill_id_here",
 "author": "example@vincross.com",
 "version": "1.0.2",
 "remote": {
     "orientation": "portrait"
 }
}
```

## 4\) Go to your Skill's detail page

From the Skill section of the Developer Bridge, select 'Details' next to your desired Skill. That will bring up a detail page.

![](/assets/Screen Shot 2017-08-14 at 4.47.38 PM.png)

## 5\) Upload your Skill and fill in information

Select 'Edit' to add a description, instructions, and release notes for your Skill. Most importantly, upload your `.mpk` package at the prompt.![](/assets/Screen Shot 2017-08-14 at 4.48.45 PM.png)

## 6\) Submit for review

Once you have filled out the necessary information, select 'Submit for Review.' This will send it to the Vincross team who will approve or reject your application. After approval, your Skill will be available in the [Skill Store](https://www.vincross.com/skill-store).

![](/assets/Screen Shot 2017-08-14 at 4.49.22 PM.png)

