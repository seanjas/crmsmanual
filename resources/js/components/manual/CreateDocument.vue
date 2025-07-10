<template>
  <BaseStepper
    :title="title"
    :steps="steps"
    @step-changed="handleStepChange"
  />
</template>

<script>
import BaseStepper from '../stepper/BaseStepper.vue'

export default {
  name: 'CreateDocument',
  components: {
    BaseStepper
  },
  data() {
    return {
      title: 'How to Create Document Using the Text Editor?',
      steps: [
        {
          title: 'Login and Compose',
          description: 'Log in to your CRMS account. On your dashboard, click "Document" on the left side of the screen, then select "Compose".',
          image: '/img_composend/document_compose.png',
          tip: 'Make sure you have the necessary permissions to create documents in the system.'
        },
        {
          title: 'Priority and Recipients',
          description: 'If the document is high-priority, tick the "Urgent" box. Then, choose the recipients by typing in their names or office. You can select individual users or entire user groups like Department Heads or Records Officers. Optionally, tick "Copy Furnish to Office" to automatically send a copy to the recipient\'s office.',
          image: '/img_composend/urgent.png',
          tip: 'Double-check recipient names to ensure documents reach the correct individuals or departments.'
        },
        {
          title: 'Category and Subject',
          description: 'Choose the appropriate record category (e.g., Administrative and Management Records) and record series (e.g., Correspondence or Issuances). Then, enter the subject of your document. Set the document\'s access level (Level 1 – Confidential, to Level 4 – General Circulation).',
          image: '/img_composend/cat_rec.png',
          tip: 'Proper categorization helps with document organization and retrieval later.'
        },
        {
          title: 'Signatory and Access',
          description: 'Choose your signatory by searching their name, and optionally add a counter signatory.',
          image: '/img_composend/sign_count.png',
          tip: 'Ensure the signatory has the appropriate authority for the document type and content.'
        },
        {
          title: 'Layout and Compose',
          description: 'Select the paper size and decide on a document header/footer (e.g., Office logo, City Mayor\'s logo, or none). Begin composing your content in the text editor. The system will auto-fill the signatory\'s name—leave 3–4 spaces above it for the signature.',
          image: '/img_composend/cusdocs.png',
          tip: 'Use the text editor\'s formatting tools to create professional-looking documents.'
        },
        {
          title: 'Attach,Preview and Send',
          description: 'Attach files or links, then preview and send. Upload PDF files under Add Attachment (you can add or delete files). To include a link, enter the URL in the Link section. Click Preview to review, then Send and confirm with Yes. The document goes to your Drafts Folder until signed, then moves to your Sent Folder.',
          image: '/img_composend/prevsend.png',
          tip: 'Always preview your document before sending to catch any errors or formatting issues.'
        }
      ]
    }
  },
  methods: {
    handleStepChange(stepIndex) {
      console.log('Create Document step changed to:', stepIndex);
      // You can add any additional logic here when steps change
    }
  }
}
</script>
