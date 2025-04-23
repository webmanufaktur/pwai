<prd_instructions>

{{prd_instructions}}

</prd_instructions>

Follow these steps to create the PRD:

<steps>
  
1. Begin with a brief overview explaining the project and the purpose of the document.
  
2. Use sentence case for all headings except for the title of the document, which can be title case, including any you create that are not included in the prd_outline below.
  
3. Under each main heading include relevant subheadings and fill them with details derived from the prd_instructions
  
4. Organize your PRD into the sections as shown in the prd_outline below
  
5. For each section of prd_outline, provide detailed and relevant information based on the PRD instructions. Ensure that you:
   - Use clear and concise language
   - Provide specific details and metrics where required
   - Maintain consistency throughout the document
   - Address all points mentioned in each section
  
6. When creating user stories and acceptance criteria:
	- List ALL necessary user stories including primary, alternative, and edge-case scenarios. 
	- Assign a unique requirement ID (e.g., US-001) to each user story for direct traceability
	- Include at least one user story specifically for secure access or authentication if the application requires user identification or access restrictions
	- Ensure no potential user interaction is omitted
	- Make sure each user story is testable
	- Review the user_story example below for guidance on how to structure your user stories
  
7. After completing the PRD, review it against this Final Checklist:
   - Is each user story testable?
   - Are acceptance criteria clear and specific?
   - Do we have enough user stories to build a fully functional application for it?
   - Have we addressed authentication and authorization requirements (if applicable)?
  
8. Format your PRD:
   - Maintain consistent formatting and numbering.
  	- Do not use dividers or horizontal rules in the output.
  	- List ALL User Stories in the output!
	  - Format the PRD in valid Markdown, with no extraneous disclaimers.
	  - Do not add a conclusion or footer. The user_story section is the last section.
	  - Fix any grammatical errors in the prd_instructions and ensure proper casing of any names.
	  - When referring to the project, do not use project_title. Instead, refer to it in a more simple and conversational way. For example, "the project", "this tool" etc.
  
</steps>

<prd_outline>

# PRD: {project_title}

## 1. Product overview

### 1.1 Document title and version

- Bullet list with title and version number as different items. Use same title as {project_title}. Example:
- PRD: {project_title}
- Version: {version_number}
-

### 1.2 Product summary

- Overview of the project broken down into 2-3 short paragraphs.

## 2. Goals

### 2.1 Business goals

- Bullet list of business goals.

### 2.2 User goals

- Bullet list of user goals.

### 2.3 Non-goals

- Bullet list of non-goals that we don't want to achieve.

## 3. User personas

### 3.1 Key user types

- Bullet list of key user types.

### 3.2 Basic persona details

- Bullet list of basic persona details based on the key user types in the following format:
- **{persona_name}**: {persona_description}
- Example:
- **Guests**: Casual visitors interested in reading public blog posts.

### 3.3 Role-based access

      - Briefly describe each user role (e.g., Admin, Registered User, Guest) and the main features/permissions available to that role in the following format:
      - **{role_name}**: {role_description}
      - Example:
      - **Guests**: Can view public blog posts and search for content.

## 4. Functional requirements

- Bullet list of the functional requirements with priority in brackets in the following format:
- **{feature_name}** (Priority: {priority_level})
  - List of requirements for the feature.
- Example:
- **Search the site**: (Priority: High)
  - Allow users to search for content by keyword.
  - Allow users to filter content by category.

## 5. User experience

### 5.1. Entry points & first-time user flow

- Bullet list of entry points and first-time user flow.

### 5.2. Core experience

- Step by step bullet list of the core experience in the following format:
- **{step_1}**: {explanation_of_step_1}
  - {how_to_make_it_a_good_first_experience}
- Example:
- **Browse posts:**: Guests and registered users navigate to the homepage to read public blog posts.
  - The homepage loads quickly and displays a list of posts with titles, short descriptions, and publication dates.

### 5.3. Advanced features & edge cases

- Bullet list of advanced features and edge cases.

### 5.4. UI/UX highlights

- Bullet list of UI/UX highlights.

## 6. Narrative

Describe the narrative of the project from the perspective of the user. For example: "{name} is a {role} who wants to {goal} because {reason}. {He/She} finds {project} and {reason_it_works_for_them}." Explain the users journey and the benefit they get from the end result. Limit the narrative to 1 paragraph only.

## 7. Success metrics

### 7.1. User-centric metrics

- Bullet list of user-centric metrics.

### 7.2. Business metrics

- Bullet list of business metrics.

### 7.3. Technical metrics

- Bullet list of technical metrics.

## 8. Technical considerations

### 8.1. Integration points

- Bullet list of integration points.

### 8.2. Data storage & privacy

- Bullet list of data storage and privacy considerations.

### 8.3. Scalability & performance

- Bullet list of scalability and performance considerations.

### 8.4. Potential challenges

- Bullet list of potential challenges.

## 9. Milestones & sequencing

### 9.1. Project estimate

- Bullet list of project estimate. i.e. "Medium: 2-4 weeks", eg:
- {Small|Medium|Large}: {time_estimate}

### 9.2. Team size & composition

- Bullet list of team size and composition. eg:
- Medium Team: 1-3 total people
  - Product manager, 1-2 engineers, 1 designer, 1 QA specialist

### 9.3. Suggested phases

- Bullet list of suggested phases in the following format:
- **{Phase 1}**: {description_of_phase_1} ({time_estimate})
  - {key_deliverables}
- **{Phase 2}**: {description_of_phase_2} ({time_estimate})
  - {key_deliverables}
- Example:
- **Phase 1:**: Develop core blogging functionality and user authentication (2 weeks)
  - Key deliverables: Landing page, blog post creation, public content viewing, user registration, login features.

## 10. User stories

Create a h3 and bullet list for each of the user stories in the following example format:

### 10.{x}. {user_story_title}

- **ID**: {user_story_id}
- **Description**: {user_story_description}
- **Acceptance criteria**: {user_story_acceptance_criteria}
- Example:

### 10.1. View public blog posts

- **ID**: US-001
- **Description**: As a guest, I want to view public blog posts so that I can read them.
- **Acceptance criteria**: - The public blog posts are displayed on the homepage. - The posts are sorted by publication date in descending order. - The posts are displayed with a title, short description, and publication date. -
  </prd_outline>

<user_story>

- ID
- Title
- Description
- Acceptance criteria

</user_story>
