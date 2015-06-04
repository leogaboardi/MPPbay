# P0
- [x] Purchase process
  - [x] Build offer model
  - [x] Build cart model
  - [x] Build offer CRUD
  - [x] Build cart CRUD
  - [x] View: cart
  - [x] View: send offer email
  - [x] Design html offer email (txt version)

- [x] Item management
  - [x] Fix item forms (new/edit): put under the right controller
  - [x] Validation
  - [x] Make the "creation draft" button work
  - [x] Dropdown lists
    -[x] New item
      -[x] Category
      -[x] Condition
      -[x] Address
    -[x] Edit item
      -[x] Category
      -[x] Condition
      -[x] Address
  - [x] Picture management

  - [ ] Picture upload should not be mandatory in the create page.

# P1
- [ ] Static pages
 - [x] Help & contact
 - [x] About
 - [x] Change jumbotrom picture
 - [x] Home page
 - [ ] Do not forget to cite Bootstrap and glyphcons.com

- [ ] Devise
  - [x] Setup email service
  - [ ] Redirect page on sign in
  - [ ] Check the redirect when a sign up occurs
  - [x] Ask for username
  - [x] Sign up: format error messages
  - [x] Sign up: put whitelist in the view
  - [x] format sign up page
  - [x] format sign in page
  - [x] format forgot your password page

- [ ] FB sign in
- [ ] Browse filtering / sort
- [ ] Clean to do lists within controllers
- [x] Destroy Condition model (use helper instead)
- [x] Destroy Categories model (use helper instead)
- [x] Destroy Status model (use helper instead)
- [x] Destroy Availability model and use helper instead.
- [x] Put whitelist email
- [ ] Summary:
  - [ ] "Items you are selling": "edit picture button"
  - [ ] "Items you are selling": item sold
  - [ ] "Drafts" tab: "create new draft"
  - [ ] Images are not properly rotated on this page
  - [ ] Hide "items you have bougth" if it is zero

# P2
- [ ] Design devise email
 - [ ] Confirmation instructions
 - [ ] Reset password
- [ ] Formatting: users/confirmation
- [ ] Design html offer email (put css, pictures and links)
- [ ] Offer email: send a reminder email to the seller if an offer is pending
- [ ] Disable items after they pass the cutoff date
- [ ] Favorite functionality
- [ ] Create SimilarItems functionality
- [ ] Create search
- [ ] Cross check access to picture management
- [ ] On product lists (summary, etc) user can choose between a simple list view, or a more "nicer" view with thumbnail, etc.
- [ ] Get rid of unused mailers (exmaple_mailer)
- [x] Item controller methods: clean up redundant methods (e.g. create vs. frontend_create)
