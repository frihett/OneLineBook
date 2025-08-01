const {onSchedule} = require("firebase-functions/v2/scheduler");
const {initializeApp} = require("firebase-admin/app");
const {getFirestore} = require("firebase-admin/firestore");
const {getMessaging} = require("firebase-admin/messaging");

initializeApp();

const db = getFirestore();
const messaging = getMessaging();

exports.sendAnniversaryNotification = onSchedule(
    {
      schedule: "every 24 hours",
      timeZone: "Asia/Seoul", // 한국 시간 기준
      region: "us-central1", // 함수 배포 리전
    },
    async (event) => {
      const now = new Date();
      const snapshot = await db.collection("users").get();

      for (const doc of snapshot.docs) {
        const data = doc.data();
        const createdAtStr = data.createAt;

        if (!createdAtStr) continue;

        const createdAtDate = new Date(Number(createdAtStr));
        if (isNaN(createdAtDate.getTime())) continue;

        const diffInDays = (now - createdAtDate) / (1000 * 60 * 60 * 24);

        // ✅ 가입한 지 7일 이하인 경우에만 알림
        if (Math.floor(diffInDays) <= 7) {
          const tokensSnap = await db
              .collection("users")
              .doc(doc.id)
              .collection("tokens")
              .get();

          for (const tokenDoc of tokensSnap.docs) {
            const token = tokenDoc.data().token;
            if (!token) continue;

            await messaging.send({
              token,
              notification: {
                title: "가입 감사드립니다!",
                body: "가입한지 1주일이 안되셨네요 👀 이것 좀 보세요!",
              },
            });
          }
        }
      }

      return null;
    },
);
