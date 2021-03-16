// The Cloud Functions for Firebase SDK to create Cloud Functions and setup triggers.
const functions = require("firebase-functions");

// The Firebase Admin SDK to access Cloud Firestore.
const admin = require("firebase-admin");
admin.initializeApp();
const database = admin.firestore();

exports.createUser = functions.auth.user().onCreate(user => {
    const { displayName, email, photoURL, uid } = user;

    const newUser = {
        name: displayName,
        photoURL,
        email,
        count: 0,
    };

    functions.logger.info("Creating User", newUser);
    return database
        .collection("users")
        .doc(uid)
        .set(newUser);
});

