{% extends "../../templates/base.html" %}

{% block page_title %}
All challenges
{% endblock %}

{% block content %}
<ul>
    {% for month in months %}
        <li><a href="{% url 'month-challenge' month %}">{{ month | title }}</a></li>
    {% endfor %}
</ul>
{% endblock %}