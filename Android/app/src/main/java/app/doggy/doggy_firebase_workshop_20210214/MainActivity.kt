package app.doggy.doggy_firebase_workshop_20210214

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import com.google.firebase.firestore.ktx.firestore
import com.google.firebase.ktx.Firebase
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Access a Cloud Firestore instance from your Activity
        val db = Firebase.firestore

        //追加ボタンの処理
        addButton.setOnClickListener {

            // Create a new user with a first and last name
            val user = hashMapOf(
                    "name" to nameText.text.toString(),
                    "nickname" to nickNameText.text.toString(),
                    "term" to termText.text.toString(),
                    "course" to courseText.text.toString(),
                    "self_introduction" to selfIntroductionText.text.toString()
            )

            // Add a new document with a generated ID
            db.collection("users")
                    .add(user)
                    .addOnSuccessListener { documentReference ->
                        Log.d("ADD_DATA", "DocumentSnapshot added with ID: ${documentReference.id}")
                    }
                    .addOnFailureListener { e ->
                        Log.w("ADD_DATA", "Error adding document", e)
                    }
        }
    }
}